#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <substitution.h>
#include <QQmlContext>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    //QGuiApplication app(argc, argv);
    QApplication app(argc, argv);
    qmlRegisterType<Substitution>("app.substitution", 1, 0, "Substitution");
    Substitution substitution;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("substitutionCpp", &substitution);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

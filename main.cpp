#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <substitution.h>
#include <QQmlContext>

#include <blockCipher.h>


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    //QApplication app(argc, argv);
    qmlRegisterType<BlockCipher>("app.blockCipher", 1, 0, "BlockCipher");
    Substitution substitution;
    BlockCipher blockCipher;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("blockCipher", &blockCipher);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

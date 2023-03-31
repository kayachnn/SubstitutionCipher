#ifndef SUBSTITUTION_H
#define SUBSTITUTION_H

#include <QVariantMap>
#include <QMap>
#include <QObject>
#include <iostream>

class Substitution : public QObject
{
    Q_OBJECT
public:
    explicit Substitution(QObject *parent = nullptr);

    Q_PROPERTY(QVariantMap frequencyData READ frequencyData WRITE setFrequencyData NOTIFY frequencyDataChanged)

    Q_INVOKABLE QString englishCipher(const QString& text, int key);
    Q_INVOKABLE QString englishDecypher(const QString& text, int key);
    Q_INVOKABLE QString turkishCipher(const QString& text, int key);
    Q_INVOKABLE QString turkishDecypher(const QString& text, int key);

    std::wstring to_wstring(const QString &str);

    QString to_qstring(const std::wstring &wstr);

    Q_INVOKABLE void create_frequency_table_english(const std::string& text);



    std::map<char, int> turkishFrequencyMap;
    std::map<char, int> englishFrequencyMap;


    QVariantMap tableEnglish;

    QVariantMap  frequencyData();
    Q_INVOKABLE void createEnglishTable();

    void setFrequencyData(const QVariantMap &newFrequencyData);

public slots:
    Q_INVOKABLE void analyzeTextTurkish(const QString& text);

signals:
    void frequencyDataChanged();
private:
    QVariantMap m_frequencyData;
};

#endif // SUBSTITUTION_H

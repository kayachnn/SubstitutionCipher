#include "substitution.h"
#include <QDebug>
#include <stdio.h>
#include <iostream>
#include <map>

#include <QVariantMap>

#include <codecvt>
#include <locale>

const std::string englishAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const std::vector<double> english_letter_frequencies = {
    8.167, 1.492, 2.782, 4.253, 12.702, 2.228, 2.015, 6.094,
    6.966, 0.153, 0.772, 4.025, 2.406, 6.749, 7.507, 1.929,
    0.095, 5.987, 6.327, 9.056, 2.758, 0.978, 2.361, 0.150,
    1.974, 0.074};

const std::wstring turkishAlphabet =      L"ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ";
const std::wstring turkishAlphabetLower = L"abcçdefgğhıijklmnoöprsştuüvyz";
const std::vector<double> turkish_letter_frequencies = {
    12.920, 2.844, 1.463, 5.206, 9.912, 0.461, 1.253, 5.491,
    8.353, 0.034, 5.683, 6.375, 3.752, 7.487, 2.976, 0.886,
    1.156, 7.722, 3.014, 3.314, 3.235, 0.959, 0.009, 0.031,
    3.336, 1.500};

Substitution::Substitution(QObject *parent)
    : QObject{parent}
{

}

QString Substitution::englishCipher(const QString& plainText, int key){
    std::wstring ciphertext;
    qDebug() << plainText;
    std::string text = plainText.toStdString();



    for (const auto& ch : text) {
        if (isalpha(ch)) {
            char base_char = isupper(ch) ? 'A' : 'a';
            ciphertext.push_back((ch - base_char + key) % 26 + base_char);
        } else {
            ciphertext.push_back(ch);
        }
    }

    return to_qstring(ciphertext);

}

// Decrypt function
QString Substitution::englishDecypher(const QString& QCiphertext, int key) {
    std::wstring plaintext;
    std::wstring ciphertext = to_wstring(QCiphertext);

    for (const auto& ch : ciphertext) {
        if (isalpha(ch)) {
            char base_char = isupper(ch) ? 'A' : 'a';
            plaintext.push_back((ch - base_char - key + 26) % 26 + base_char);
        } else {
            plaintext.push_back(ch);
        }
    }

    return to_qstring(plaintext);
}



QString Substitution::turkishCipher(const QString& QPlaintext, int key) {
    std::wstring ciphertext;
    std::wstring plaintext = to_wstring(QPlaintext);

    for (const auto &ch : plaintext) {
        if(ch == ' '){
            ciphertext.push_back(ch);
            continue;
        }
        if (isupper(ch)) {
            qDebug() << "char is upper";
            //uppercase
            size_t index = turkishAlphabet.find(ch);
            size_t shifted_index = (index + key) % 29;
            wchar_t encrypted_char = turkishAlphabetLower[shifted_index];
            ciphertext.push_back(encrypted_char);
        } else {
            //lowercase
            qDebug() << "char is lower";

            size_t index = turkishAlphabetLower.find(ch);
            size_t shifted_index = (index + key) % 29;
            wchar_t encrypted_char = turkishAlphabetLower[shifted_index];

            ciphertext.push_back(encrypted_char);
        }
    }
    qDebug() << "turkish cipher " << QString::fromStdWString(ciphertext);
    return to_qstring(ciphertext);
}

// Decrypt function
QString Substitution::turkishDecypher(const QString& QCiphertext, int key) {
    std::wstring plaintext;
    std::wstring ciphertext = to_wstring(QCiphertext);

    for (const auto& ch : ciphertext) {
        if (iswalpha(ch)) {
            wchar_t base_char = iswupper(ch) ? L'A' : L'a';
            wchar_t uppercase_char = towupper(ch);
            size_t index = turkishAlphabet.find(uppercase_char);
            size_t shifted_index = (index - key + 29) % 29;
            wchar_t decrypted_char = turkishAlphabet[shifted_index];
            plaintext.push_back(iswupper(ch) ? decrypted_char : towlower(decrypted_char));
        } else {
            plaintext.push_back(ch);
        }
    }

    return to_qstring(plaintext);
}


std::wstring Substitution::to_wstring(const QString &str) {
    std::wstring_convert<std::codecvt_utf8<wchar_t>, wchar_t> converter;
    return converter.from_bytes(str.toStdString());
}

QString Substitution::to_qstring(const std::wstring &wstr) {
    std::wstring_convert<std::codecvt_utf8<wchar_t>, wchar_t> converter;
    return QString::fromStdString(converter.to_bytes(wstr));
}

// Function to create a frequency table of the given text
void Substitution::create_frequency_table_english(const std::string& text) {
    std::map<char, int> frequency_table;
    for(int i=0; i<englishAlphabet.size(); i++){
        frequency_table[i] = 0;
    }

    for (char c : text) {
        if (isalpha(c) && isupper(c)) {
            frequency_table[c]++;
        }
    }
}

// Function to create a frequency table of the given text
void Substitution::analyzeTextTurkish(const QString& text) {

    turkishFrequencyMap.clear();
    for(int i=0; i<turkishAlphabet.size(); i++){
        turkishFrequencyMap[i] = 0;
    }

    for (char c : text.toStdString()) {
        if(isupper(c)){
            //uppercase
            size_t index = turkishAlphabet.find(c);
            turkishFrequencyMap[c]++;
        }
        else{
            //lowercase
            size_t index = turkishAlphabetLower.find(c);
            turkishFrequencyMap[c]++;

        }
    }
    emit frequencyDataChanged();

}

QVariantMap Substitution::frequencyData(){
    QVariantMap dataMap;
    for (auto it = turkishFrequencyMap.begin(); it != turkishFrequencyMap.end(); ++it)
    {
        dataMap.insert(QString(it->first), it->second);
    }

    return dataMap;
}

void Substitution::createEnglishTable(){
    for (auto it = englishFrequencyMap.begin(); it != englishFrequencyMap.end(); ++it)
    {
        tableEnglish.insert(QString(it->first), it->second);
    }

}

void Substitution::setFrequencyData(const QVariantMap &newFrequencyData)
{
    if (m_frequencyData == newFrequencyData)
        return;
    m_frequencyData = newFrequencyData;
    emit frequencyDataChanged();
}

#include "blockCipher.h"

#include <QString>
#include <random>
#include <QDebug>
#include <iostream>

BlockCipher::BlockCipher(QObject *parent)
    : QObject{parent}
{

}

QString BlockCipher::generateKey(QString qTotalBytes){
    QString key ="";
    int totalBytes = std::stoi(qTotalBytes.toStdString());

    std::vector<uint8_t> arr(totalBytes, 0x00);

    generateRandomByteArray(arr.data(), totalBytes);
    std::string keyHex(totalBytes*2, 0x00);

    qDebug() << "generated key\n";
    for(size_t i=0; i<arr.size(); i++){
        snprintf(keyHex.data()+2*i,totalBytes*2, "%.02x", arr[i]);
        printf("%2x\n", arr[i]);
    }

    qDebug() << "key hex";
    std::cout << "key hex\n";
    printf("key hex\n");
    key = QString::fromStdString(keyHex);
    qDebug() << key;

    return key;
}


void BlockCipher::generateRandomByteArray(uint8_t* arr, size_t length){
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 255);

    for(size_t i=0; i<length; i++){
        arr[i] = static_cast<uint8_t>(dis(gen));
    }

}

int generateSbox(SBox& sbox){
    for(size_t i=0; i<MAX_UINT; i++){
        sbox[i] = static_cast<uint8_t> (~i) + 10;
    }
    return 0;
}

uint8_t applySbox(SBox sbox, uint8_t val){
    return sbox[val];
}

uint8_t pBox(uint8_t input) {
    uint8_t leftNibble = input & 0xF0;
    uint8_t rightNibble = input & 0x0F;
    return (leftNibble >> 4) | (rightNibble << 4);
}


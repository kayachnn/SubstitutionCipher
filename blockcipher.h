#ifndef BLOCKCIPHER_H
#define BLOCKCIPHER_H

#include <QObject>
#define MAX_UINT 256

typedef std::vector<uint8_t> SBox;

class BlockCipher : public QObject
{
    Q_OBJECT
public:
    explicit BlockCipher(QObject *parent = nullptr);

    Q_INVOKABLE QString generateKey(QString totalBytes);

    void generateRandomByteArray(uint8_t *arr, size_t arrSize);

    uint8_t pBox(uint8_t data);
    int generateSbox(SBox& sbox);
    uint8_t applySbox(SBox& sbox, uint8_t val);

signals:

};

#endif // BLOCKCIPHER_H

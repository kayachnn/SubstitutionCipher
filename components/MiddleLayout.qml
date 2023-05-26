import QtQuick 2.15
import QtQuick.Layouts 2.15

//orta taraf
Rectangle{
    id: rectangle
    Layout.fillWidth: true
    Layout.fillHeight: true
    width: parent.width
    color: "gray"
    border.color: "black"
    border.width: 2
    Layout.margins: 5
    property alias plainText: plainTextInput.text
    property alias cipherText: cipherTextInput.text


    RowLayout{
        width:  parent.width
        height: parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing: 2


        PlainTextInput{
            id:plainTextInput
        }

        CipherTextInput{
            id:cipherTextInput
        }

        GraficOutput{

        }

    }

}

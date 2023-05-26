import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Rectangle{
    Layout.fillHeight: true
    Layout.fillWidth: true
    width: parent.width
    height: parent.height
    border.width: 2
    border.color: "black"
    Layout.leftMargin: 5
    Layout.rightMargin: 5
    color: "gainsboro"

    ColumnLayout{
        height: parent.height
        width: parent.width
        Layout.margins: 5

        RowLayout{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height/2

            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                border.width: 2
                border.color: "black"
                Layout.preferredWidth: parent.width*2/3
                color: "gainsboro"
                Text {
                    padding: 5
                    id: generateKeyText
                    text: qsTr("")
                }
            }

            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: parent.width/3
                border.width: 2
                border.color: "black"
                color: "gainsboro"

                ColumnLayout{
                    Label{
                        text: "Key Size in Bytes"
                        color: "black"
                    }
                    ComboBox{
                        bottomPadding: 5
                        id: keySize
                        currentIndex: 0
                        model:["16", "24", "32"]
                    }
                }
            }


        }



        Button{
            id:generateKeyButton
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height/2
            text: "Generate Key"
            contentItem: Text {
                text: generateKeyButton.text
                color: "black" // Set the text color to black
                font: generateKeyButton.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                var value = keySize.currentValue
                generateKeyText.text = blockCipher.generateKey(value);}
        }

    }


}

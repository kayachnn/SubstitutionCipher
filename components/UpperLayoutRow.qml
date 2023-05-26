import QtQuick 2.15
import QtQuick.Layouts 2.15

RowLayout{
    Layout.fillHeight: true
    Layout.fillWidth: true
    spacing: 0

    Rectangle{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: parent.width/3
        border.width: 2
        color: "gainsboro"
        Text {
            anchors.centerIn: parent
            text: qsTr("Plain Text")
            font.pointSize: 24
        }

    }
    Rectangle{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: parent.width/3
        border.width: 2
        color: "gainsboro"
        Text {
            anchors.centerIn: parent
            text: qsTr("Cipher Text")
            font.pointSize: 24
        }
    }
    Rectangle{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: parent.width/3
        border.width: 2
        color: "gainsboro"
        Text {
            anchors.centerIn: parent
            text: qsTr("Grafik")
            font.pointSize: 24
        }
    }
}

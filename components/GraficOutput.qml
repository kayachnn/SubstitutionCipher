import QtQuick 2.15
import QtQuick.Layouts 2.15

Rectangle{
    Layout.fillHeight: true
    Layout.fillWidth: true
    color: "gainsboro"
    width: parent.width/3
    Layout.preferredHeight:  parent.height
    border.color: "black"
    border.width: 2
    clip: true

    ListView {
        id: characterFrequencyList
        anchors.fill: parent
        anchors.margins: 10
    }
}

import QtQuick 2.15
import QtQuick.Layouts 2.15
import QtQuick.Controls 2.15

Rectangle{
    Layout.fillHeight: true
    Layout.fillWidth: true
    color: "gainsboro"
    border.color: "black"
    border.width: 2
    Layout.margins: 5
    ColumnLayout{
        Label{
            padding: 5
            text: "Dil"
            color: "black"
        }
        ComboBox{
            padding: 5
            id: dil
            currentIndex: 0
            model:["Türkçe", "İngilizce"]
        }
    }
}

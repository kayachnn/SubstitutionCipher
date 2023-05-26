import QtQuick 2.15
import QtQuick.Layouts 2.15

ColumnLayout{
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.margins: 5

    UpperLayoutText{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height*2/3
    }

    UpperLayoutRow{
        Layout.preferredHeight: parent.height/3
    }
}

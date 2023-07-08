import QtQuick 2.12

Rectangle {
    id: tabButton
    width:  label.width + 32
    height: 40
    color: "transparent"

    property bool selected: false
    property alias text: label.text
    property string category: "undefined"
    
    signal clicked(var name)

    MouseArea {
        anchors.fill: parent
        onClicked: tabButton.clicked(label.text)
    }

    Rectangle {
        id: tabBackground
        width: parent.width
        height: parent.height
        color: tabButton.selected ? "blue" : "gray"
    }

    Text {
        id: label
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 16
    }
}
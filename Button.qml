import QtQuick 2.12
import QtGraphicalEffects 1.12

Item {
    FontLoader { id: robotoFont; source: "../Resources/Fonts/Roboto/Roboto-Regular.ttf"}
    id: containedButton
    height: 36
    width:  content.width + 32
    property bool outlined: true
    property string backgroundColor: "blue"
    property string buttonText: "Button"
    property string textColor: outlined ? backgroundColor : "white"
    property string icon: ""
    property string iconColor: textColor
    property alias containsMouse: ma.containsMouse

    signal clicked()

    Rectangle {
        id: rectangle
        color: outlined ? "transparent" : backgroundColor
        radius: 5
        
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        border.width: outlined ? 2 : 0
        border.color:  outlined ? backgroundColor : "transparent"
    }

    Item
    {
        id: content
        width: bText.width
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: bText
            text: buttonText
            color: textColor
            font.capitalization: Font.Capitalize
            font.pointSize: 12
            font.family: robotoFont.name
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Image
        {
            id: bIcon
            width: 20
            height: 20
            anchors.right: bText.left
            anchors.rightMargin: 5
            anchors.verticalCenter: bText.verticalCenter
            source: icon

            Component.onCompleted: { if( icon != "") content.width = content.width + bIcon.width }
            
            ColorOverlay {
                anchors.fill: parent
                source: parent
                color: iconColor
            }
        }
    }

    MouseArea
    {
        id: ma
        anchors.fill: parent
        onClicked: containedButton.clicked()
        onEntered: rectangle.opacity = 0.5
        onExited: rectangle.opacity = 1
        hoverEnabled: true
    }


}

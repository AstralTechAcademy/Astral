import QtQuick 2.0
import "../../Constants/Constants.js" as Constants
import QtGraphicalEffects 1.12

Item {

    id: iconPlaneButton

    property int iconSize_: 30
    property string iconSource_: "qrc:/icons/done-circle-white"
    property string color_: "white"
    property int width_: iconSize_ + message.width
    property int height_: iconSize_
    property string textColor_: "white"
    property string text_: "Notification message"

    width: width_
    height: height_

    signal clicked()

    Image
    {
        id: icon
        source: iconSource_
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: 30
        height: 30

        ColorOverlay {
            anchors.fill: parent
            source: parent
            color: "white"
        }
    }

    Text
    {
        id: message
        color: textColor_
        text: text_
        font.pixelSize: 15
        anchors.left: icon.right
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: iconPlaneButton.clicked()
    }
}

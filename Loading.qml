import QtQuick 2.12

Item
{
    id: loading
    property string colorPoint1_: "red"
    property string colorPoint2_: "green"
    property string colorPoint3_: "yellow"
    property int space_: 5
    property int pointSize_: 15
    width: pointSize_ * 3 + space_ * 2
    height: pointSize_

    state: "default"
    states:[
        State {
            name: "default"
        },
        State {
            name: "first"
            PropertyChanges {
                target:  p1;
                anchors.topMargin: -5
            }
            PropertyChanges {
                target:  p3;
                anchors.topMargin: 0
            }
        },
        State {
            name: "second"
            PropertyChanges {
                target:  p2;
                anchors.topMargin: -5
            }
            PropertyChanges {
                target:  p1;
                anchors.topMargin: 0
            }
        },
        State {
            name: "third"
            PropertyChanges {
                target:  p3;
                anchors.topMargin: -5
            }
            PropertyChanges {
                target:  p2;
                anchors.topMargin: 0
            }
        }             
    ]

    transitions: [
        Transition {
            from: "default"; to: "first"; reversible: true
            ParallelAnimation {
                NumberAnimation { properties: "anchors.topMargin"; duration: 500; easing.type: Easing.InOutQuad }
            }
        },
        Transition {
            from: "first"; to: "second"; reversible: true
            ParallelAnimation {
                NumberAnimation { properties: "anchors.topMargin"; duration: 500; easing.type: Easing.InOutQuad }
            }
        },
        Transition {
            from: "second"; to: "third"; reversible: true
            ParallelAnimation {
                NumberAnimation { properties: "anchors.topMargin"; duration: 500; easing.type: Easing.InOutQuad }
            }
        },
        Transition {
            from: "third"; to: "first"; reversible: true
            ParallelAnimation {
                NumberAnimation { properties: "anchors.topMargin"; duration: 500; easing.type: Easing.InOutQuad }
            }
        }
    ]

    Rectangle
    {
        id: p1
        width: pointSize_
        height: pointSize_
        radius: width / 2
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        color: colorPoint1_
    }

    Rectangle
    {
        id: p2
        width: pointSize_
        height: width
        radius: width / 2
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: p1.right
        anchors.leftMargin: space_
        color: colorPoint2_
    }

    Rectangle
    {
        id: p3
        width: pointSize_
        height: width
        radius: width / 2
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: p2.right
        anchors.leftMargin: space_
        color: colorPoint3_
    }

    Timer {
        interval: 500; running: true; repeat: true
        onTriggered:  {
            if(loading.state == "default")
                loading.state = "first"
            else if(loading.state == "first")
                loading.state = "second"
            else if(loading.state == "second")
                loading.state = "third"
            else if(loading.state == "third")
                loading.state = "first"
            else
                loading.state = "default"
        }
    }
}
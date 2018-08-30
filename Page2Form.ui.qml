import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id: item1
    width: 1920
    height: 1080
    z: -1

    Image {
        id: image
        anchors.fill: parent
        z: 0
        source: "res/2.png"
    }

    //    Chart {
    //        id: chart
    //        anchors.rightMargin: 41 * parent.width / 1920
    //        anchors.bottomMargin: 287 * parent.height / 1080
    //        anchors.leftMargin: 1120 * parent.width / 1920
    //        anchors.topMargin: 136 * parent.height / 1080
    //        z: 0
    //        anchors.fill: parent
    //    }
    Chart {
        id: chart
        anchors.leftMargin: 1104 * parent.width / 1920
        anchors.topMargin: 127 * parent.height / 1080
        anchors.rightMargin: 25 * parent.width / 1920
        anchors.bottomMargin: 276 * parent.height / 1080
        z: 0
        anchors.fill: parent
    }
}

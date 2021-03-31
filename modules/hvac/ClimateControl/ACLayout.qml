import QtQuick 2.11
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0

Item {
    id: __root
    anchors.fill: parent

    Item {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top


        RowLayout {
            height: parent.height / 2
            anchors.left: parent.left
            anchors.right: parent.right

            HVACControlZone {
                Layout.fillHeight: true
                Layout.fillWidth: true
                zone:"FrontLeft"
                visible: HVACPlugin.hvacSettings["FrontLeft"].Direction !== undefined | HVACPlugin.hvacSettings["FrontLeft"].Fan === true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.maximumWidth: parent.width/2
            }

            HVACControlZone {
                inverted: true
                Layout.fillHeight: true
                Layout.fillWidth: true
                zone:"FrontRight"
                visible: HVACPlugin.hvacSettings["FrontRight"].Direction !== undefined | HVACPlugin.hvacSettings["FrontRight"].Fan === true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.maximumWidth: parent.width/2
            }
        }

        RowLayout {
            height: parent.height / 2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            HVACControlZone {
                Layout.fillWidth: true
                Layout.fillHeight: true
                zone:"RearLeft"
                visible: HVACPlugin.hvacSettings["RearLeft"].Direction !== undefined | HVACPlugin.hvacSettings["RearLeft"].Fan === true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.maximumWidth: parent.width/2
            }

            HVACControlZone {
                inverted: true
                Layout.fillWidth: true
                Layout.fillHeight: true
                zone:"RearRight"
                visible: HVACPlugin.hvacSettings["RearRight"].Direction !== undefined | HVACPlugin.hvacSettings["RearRight"].Fan === true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.maximumWidth: parent.width/2
            }
        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorColor:"#4c4e50";height:480;width:640}
}
##^##*/

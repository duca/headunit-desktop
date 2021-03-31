import QtQuick 2.6
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.0

Item{
    id: fan_direction
    Layout.fillHeight: true
    Layout.fillWidth: true

    Image {
        id: buttons_bg
        width: parent.width
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        fillMode: Image.PreserveAspectFit
        source: "qrc:/HVAC/icons/cars/v50.png"
        mipmap:true
    }

    Item{
        id:buttons
        width: buttons_bg.paintedWidth
        height: buttons_bg.paintedHeight
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        GridLayout {
            id: gridLayout
            rows: 3
            columns: 4
            columnSpacing: 0
            rowSpacing: 0
            anchors.fill: parent
            anchors.rightMargin: parent.width * 0.2
            anchors.leftMargin: parent.width * 0.4

            ImageButton {
                id: front_top_button
                visible: (HVACPlugin.hvacSettings.air_dir_rear_top == "true")
                Layout.rowSpan: 1
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: "qrc:/HVAC/icons/ac-buttons_03.png"
                fillMode: Image.PreserveAspectFit
                checked: HVACPlugin.parameters.FrontTop;
                onClicked:{
                    HVACPlugin.toggleParameter("FrontTop")
                }
            }

            ImageButton {
                id: rear_top_button
                visible: (HVACPlugin.hvacSettings.air_dir_top == "true")
                Layout.rowSpan: 1
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: "qrc:/HVAC/icons/ac-buttons_04.png"
                fillMode: Image.PreserveAspectFit
                checked: HVACPlugin.parameters.RearTop;
                onClicked:{
                    HVACPlugin.toggleParameter("RearTop")
                }
            }

            ImageButton {
                id: front_middle_button
                visible: (HVACPlugin.hvacSettings.air_dir_centre == "true")
                Layout.rowSpan: 1
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: "qrc:/HVAC/icons/ac-buttons_06.png"
                fillMode: Image.PreserveAspectFit
                checked: HVACPlugin.parameters.FrontMiddle;
                onClicked:{
                    HVACPlugin.toggleParameter("FrontMiddle")
                }
            }

            ImageButton {
                id: rear_middle_button
                visible: (HVACPlugin.hvacSettings.air_dir_rear_centre == "true")
                Layout.rowSpan: 1
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: "qrc:/HVAC/icons/ac-buttons_07.png"
                fillMode: Image.PreserveAspectFit
                checked: HVACPlugin.parameters.RearMiddle;
                onClicked:{
                    HVACPlugin.toggleParameter("RearMiddle")
                }
            }

            ImageButton {
                id: front_bottom_button
                visible: (HVACPlugin.hvacSettings.air_dir_bottom == "true")
                Layout.rowSpan: 1
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: "qrc:/HVAC/icons/ac-buttons_08.png"
                fillMode: Image.PreserveAspectFit
                checked: HVACPlugin.parameters.FrontBottom;
                onClicked:{
                    HVACPlugin.toggleParameter("FrontBottom")
                }
            }

            ImageButton {
                id: rear_bottom_button
                visible: (HVACPlugin.hvacSettings.air_dir_rear_bottom == "true")
                Layout.rowSpan: 1
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
                source: "qrc:/HVAC/icons/ac-buttons_09.png"
                fillMode: Image.PreserveAspectFit
                checked: HVACPlugin.parameters.RearBottom;
                onClicked:{
                    HVACPlugin.toggleParameter("RearBottom")
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorColor:"#4c4e50";height:300;width:800}
}
##^##*/

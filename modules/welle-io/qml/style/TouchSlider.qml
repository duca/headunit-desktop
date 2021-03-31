import QtQuick 2.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

// Import custom styles
import "."

ColumnLayout {
    id: masterColumn

    signal valueChanged(double valueGain)

    property alias name: nameView.text
    property alias maximumValue: slider.maximumValue
    property alias showCurrentValue: valueView.text
    property alias currentValue: slider.value


    Layout.preferredWidth: parent.width
    spacing: 10
    opacity: enabled ? 1 : 0.5

    RowLayout {
        Layout.preferredWidth: parent.width

        Text {
            id: nameView
            font.pixelSize: 22
            color: "#ffffff"
            Layout.alignment: Qt.AlignLeft
        }

        Text {
            id: valueView
            text: "Value: "
            font.pixelSize: 22
            color: "#ffffff"
            Layout.alignment: Qt.AlignRight
        }
    }

    Slider {
        id: slider
        style: sliderStyle
        maximumValue: 100
        minimumValue: 0
        value: 0
        stepSize: 1

        Layout.preferredWidth: parent.width
        onValueChanged: masterColumn.valueChanged(value)

        /* Slider Style */
        Component {
            id: sliderStyle
            SliderStyle {
                handle: Rectangle {
                    width: 18
                    height: 18
                    radius: height
                    antialiasing: true
                    color: Qt.lighter("#468bb7", 1.2)
                }

                groove: Item {
                    Rectangle {
                        height: 5
                        width: parent.width
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#444"
                        opacity: 0.8
                        Rectangle {
                            antialiasing: true
                            radius: 1
                            color: "#468bb7"
                            height: parent.height
                            width: parent.width * control.value / control.maximumValue
                        }
                    }
                }
            }
        }
    }
}

#include "usbconnectionlistenerplugin.h"

UsbConnectionListenerPlugin::UsbConnectionListenerPlugin(QObject *parent) : QObject (parent), connectionListener()
{
    connect(&connectionListener, &UsbConnectionListener::usbDeviceAdded, this, &UsbConnectionListenerPlugin::usbDeviceAdded);
    connect(&connectionListener, &UsbConnectionListener::usbDeviceRemoved, this, &UsbConnectionListenerPlugin::usbDeviceRemoved);

    QThreadPool::globalInstance()->start(&connectionListener);
    m_pluginSettings.events = QStringList() << "UsbDeviceAdded" << "UsbDeviceRemoved";
}

void UsbConnectionListenerPlugin::init(){

}
QObject *UsbConnectionListenerPlugin::getContextProperty(){
    return new QObject();
}

void UsbConnectionListenerPlugin::usbDeviceAdded(QVariantMap deviceDetails){
    QJsonDocument json = QJsonDocument::fromVariant(deviceDetails);
    emit message("UsbDeviceAdded", json.toJson(QJsonDocument::Compact));

    QVariantMap notificationDetails;
    QString notificationText = QString("%1 %2").arg(deviceDetails.value("manufacturer").toString())
                                               .arg(deviceDetails.value("product").toString());
    notificationDetails.insert("description", notificationText);
    notificationDetails.insert("title", "New USB device connected");
    notificationDetails.insert("image", "qrc:/qml/icons/usb.png");

    json = QJsonDocument::fromVariant(notificationDetails);

    emit message("GUI::Notification", json.toJson(QJsonDocument::Compact));
}

void UsbConnectionListenerPlugin::usbDeviceRemoved(QVariantMap deviceDetails){
    QJsonDocument json = QJsonDocument::fromVariant(deviceDetails);
    emit message("UsbDeviceRemoved", json.toJson(QJsonDocument::Compact));
}


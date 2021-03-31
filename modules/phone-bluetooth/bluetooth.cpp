#include "bluetooth.h"

PhoneBluetooth::PhoneBluetooth(QObject *parent)
{
    telephonyManager = new TelephonyManager();
}

QObject *PhoneBluetooth::getContextProperty(){
    return qobject_cast<QObject *>(telephonyManager);
}

void PhoneBluetooth::init() {

}

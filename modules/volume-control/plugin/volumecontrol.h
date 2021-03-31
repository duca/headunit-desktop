#ifndef VOLUMECONTROL_H
#define VOLUMECONTROL_H

#include <QObject>
#include <plugininterface.h>

class VolumeControl : public QObject, PluginInterface
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.viktorgino.headunit.volumecontrol" FILE "config.json")
    Q_INTERFACES(PluginInterface)
public:
    explicit VolumeControl(QObject *parent = nullptr);
    QObject *getContextProperty() override;
    QQuickImageProvider *getImageProvider() override;
    QStringList eventListeners() override;
    QStringList events() override;
    QStringList actions() override;

signals:

public slots:
    void eventMessage(QString id, QString message) override;
    void actionMessage(QString id, QString message) override;
};

#endif // VOLUMECONTROL_H

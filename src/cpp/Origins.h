#ifndef ORIGINS_H
#define ORIGINS_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Origin.h"
#include "FeatureBonus.h"

class Origins : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Origin> origins READ origins NOTIFY originsChanged)
    Q_PROPERTY(QStringList originsNames READ originsNames NOTIFY originsNamesChanged)
public:
    explicit Origins(QObject *parent = nullptr);

    QQmlListProperty<Origin> origins();
    void appendOrigin(Origin*);
    int originsCount() const;
    Origin *origin(int) const;
    void clearOrigins();

    QStringList originsNames();

signals:
    void originsChanged();
    void originsNamesChanged();

public slots:
    Q_INVOKABLE void loadOrigins(const QString &filePath);

private:
    FeatureBonus *createFeatureBonus(const QJsonObject &bonus);
    static void appendOrigin(QQmlListProperty<Origin>*, Origin*);
    static int originsCount(QQmlListProperty<Origin>*);
    static Origin *origin(QQmlListProperty<Origin>*, int);
    static void clearOrigins(QQmlListProperty<Origin>*);

private:
    QVector<Origin*> m_origins;
    QStringList m_originsNames;
};

#endif // ORIGINS_H

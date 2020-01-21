#ifndef ATTRIBUTES_H
#define ATTRIBUTES_H

#include <QObject>
#include <QVector>
#include <QQmlListProperty>

#include "Attribute.h"

class Attributes : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<Attribute> attributes READ attributes NOTIFY attributesChanged)
    Q_PROPERTY(QStringList attributesNames READ attributesNames NOTIFY attributesNamesChanged)
public:
    explicit Attributes(QObject *parent = nullptr);

    QQmlListProperty<Attribute> attributes();
    void appendAttribute(Attribute*);
    int attributesCount() const;
    Attribute *attribute(int) const;
    void clearAttributes();

    QStringList attributesNames();

signals:
    void attributesChanged();
    void attributesNamesChanged();

public slots:
    Q_INVOKABLE void loadAttributes(const QString &filePath);

private:
    static void appendAttribute(QQmlListProperty<Attribute>*, Attribute*);
    static int attributesCount(QQmlListProperty<Attribute>*);
    static Attribute *attribute(QQmlListProperty<Attribute>*, int);
    static void clearAttributes(QQmlListProperty<Attribute>*);

private:
    QVector<Attribute*> m_attributes;
    QStringList m_attributesNames;
};

#endif // ATTRIBUTES_H

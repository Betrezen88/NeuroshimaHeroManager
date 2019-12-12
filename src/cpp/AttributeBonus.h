#ifndef ATTRIBUTEBONUS_H
#define ATTRIBUTEBONUS_H

#include <QObject>

class AttributeBonus: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(int value READ value CONSTANT)
public:
    AttributeBonus(QObject *parent = nullptr): QObject(parent) {}
    AttributeBonus(const QString &name, const int &value, QObject *parent = nullptr):
        QObject(parent),
        m_name(name),
        m_value(value)
    {}

    QString name() { return m_name; }
    int value() { return m_value; }

private:
    QString m_name;
    int m_value;
};

#endif // ATTRIBUTEBONUS_H

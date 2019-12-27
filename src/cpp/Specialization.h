#ifndef SPECIALIZATION_H
#define SPECIALIZATION_H

#include <QObject>

class Specialization: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString description READ description CONSTANT)
public:
    Specialization(QObject *parent = nullptr) : QObject(parent) {}
    Specialization(const QString &name,
                   const QString &description,
                   QObject *parent = nullptr)
        : QObject(parent),
          m_name(name),
          m_description(description)
    {}

    QString name() const { return m_name; }
    QString description() const { return m_description; }

private:
    QString m_name;
    QString m_description;
};

#endif // SPECIALIZATION_H

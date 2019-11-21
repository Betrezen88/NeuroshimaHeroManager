import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    id: statsView
    anchors.fill: parent
    anchors.topMargin: 5

    ScrollView {
        id: content
        anchors.fill: parent
        clip: true

        ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        Row {
            spacing: 10

            Column {
                id: column1
                spacing: 5

                PersonalView {
                    id: personalView
                }

                TricksView {
                    id: tricksView
                    width: personalView.width
                    height: 300
                }
            }

            Column {
                id: column2
                spacing: 10
            }

            Column {
                id: column3
                spacing: 10
            }

            Column {
                id: column4
                spacing: 10
            }
        }
    }

    Component.onCompleted: {
        addAttributes();
        addCustomSkills();
    }

    function addAttributes() {
        var attributes = [
                    {
                      name: "Budowa",
                      value: 14,
                      skillpacks: [
                          {
                              name: "Sprawność",
                              specializations: [ "Wojownik" ],
                              skills: [
                                { name: "Kondycja", value: 0 },
                                { name: "Wspinaczka", value: 0 },
                                { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Jeździectwo",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                      ]
                  },
                  { name: "Zręczność",
                    value: 13,
                    skillpacks: [
                        {
                            name: "Walka Wręcz",
                            specializations: [ "Wojownik" ],
                            skills: [
                               { name: "Kondycja", value: 0 },
                               { name: "Wspinaczka", value: 0 },
                               { name: "Pływanie", value: 0 }
                            ]
                        },
                      {
                          name: "Prowadznie Pojazdów",
                          specializations: [ "Wojownik" ],
                          skills: [
                             { name: "Kondycja", value: 0 },
                             { name: "Wspinaczka", value: 0 },
                             { name: "Pływanie", value: 0 }
                          ]
                      },
                      {
                          name: "Zdolności Manualne",
                          specializations: [ "Wojownik" ],
                          skills: [
                             { name: "Kondycja", value: 0 },
                             { name: "Wspinaczka", value: 0 },
                             { name: "Pływanie", value: 0 }
                          ]
                      },
                      {
                          name: "Broń Strzelecka",
                          specializations: [ "Wojownik" ],
                          skills: [
                             { name: "Kondycja", value: 0 },
                             { name: "Wspinaczka", value: 0 },
                             { name: "Pływanie", value: 0 }
                          ]
                      },
                      {
                          name: "Broń Dystansowa",
                          specializations: [ "Wojownik" ],
                          skills: [
                             { name: "Kondycja", value: 0 },
                             { name: "Wspinaczka", value: 0 },
                             { name: "Pływanie", value: 0 }
                          ]
                      }
                    ]
                  },
                  {
                      name: "Charakter",
                      value: 15,
                      skillpacks: [
                          {
                              name: "Negocjacje",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Empatia",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Siła Woli",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          }
                      ]
                  },
                  {
                      name: "Percepcja",
                      value: 12,
                      skillpacks: [
                          {
                              name: "Orientacja w Terenie",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Spostrzegawczość",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Kamuflaż",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Przetrwanie",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          }
                      ]
                  },
                  { name: "Spryt",
                      value: 11,
                      skillpacks: [
                          {
                              name: "Medycyna",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Technika",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Wiedza Ogólna",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Sprzęt",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          },
                          {
                              name: "Pirotechnika",
                              specializations: [ "Wojownik" ],
                              skills: [
                                 { name: "Kondycja", value: 0 },
                                 { name: "Wspinaczka", value: 0 },
                                 { name: "Pływanie", value: 0 }
                              ]
                          }
                      ]
                  }
                ];
        for ( var i in attributes ) {
            var parent;
            if ( parseInt(i) <= 1 )
                parent = column2;
            else if ( parseInt(i) >= 2 && parseInt(i) <=3 )
                parent = column3;
            else
                parent = column4;
            var component = Qt.createComponent("AttributeView.qml");
            var attribute = component.createObject( parent, {
                                                       name: attributes[i].name,
                                                       value: attributes[i].value,
                                                       mod: 0,
                                                       skillpacks: attributes[i].skillpacks
                                                   } );
        }
    }

    function addCustomSkills() {
        var component = Qt.createComponent("CustomSkillsView.qml");
        var customSkillsView = component.createObject( column4, {
                                                        height: 270,
                                                        width: 250
                                                      } );
        customSkillsView.anchors.right = column4.right;
    }
}

/*##^##
Designer {
    D{i:3;anchors_height:400}D{i:1;anchors_height:400}D{i:4;anchors_height:400;anchors_x:0}
D{i:5;anchors_height:400;anchors_x:0}
}
##^##*/

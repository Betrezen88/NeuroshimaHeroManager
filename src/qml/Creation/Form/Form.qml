import QtQuick 2.0
import QtQuick.Controls 2.5

ScrollView {
    property alias name: name.text
    property alias nickname: nickname.text
    property alias surname: surname.text

    id: creationForm
    clip: true

    Column {
        spacing: 5
        anchors.fill: parent
        anchors.margins: 5

        Row {
            height: 50
            spacing: 5

            TextField {
                id: name
                height: 50
                width: creationForm.width/3
                placeholderText: "Imię"
            }

            TextField {
                id: nickname
                height: 50
                width: creationForm.width/3
                placeholderText: "Ksywa"
            }

            TextField {
                id: surname
                height: 50
                width: creationForm.width/3 - 20
                placeholderText: "Nazwisko"
            }
        }

        Question {
            id: question1
            question: "Jest późny wieczór, od zachodu zbliża się wichura, pierwsze podmuchy poruszają konarami skarłowaciałych drzew. Wyłaniasz się zza załomu muru, przekraczasz ulicę i wchodzisz do knajpy. Panujący w niej zgiełk ustaje, a zgromadzeni wewnątrz dostrzegają..."
            description: "Jak wyglądasz? Jak się poruszasz, jak spoglądasz? Jesteś wysoki czy niski, ubierasz się niechlujnie czy szpanersko? Broń jest widoczna czy ukryta pod płaszczem? jesteś pewny siebie czy raczej czujnym wzrokiem spoglądasz w stronę nieznajomych?"
            width: creationForm.width-10
        }

        Question {
            id: question2
            question: "Siedzisz przy barze, rozglądając się po zniszczonych, poprzecinanych seriami pocisków ścianach. W pewnym momencie dosiada się facet o krzywym spojrzeniu i stawia Ci piwo. Co robisz?"
            description: "Jesteś kontaktowy czy mrukliwy? Łatwo nawiązujesz przyjaźnie czy raczej jesteś nieufny? A może Twój styl bycia sprawia, że takie patałachy nigdy się do Ciebie nie dostają? Gaasz jak najęty czy cedzisz słowa jak Clint Eastwood?"
            width: creationForm.width-10
        }

        Question {
            id: question3
            question: "W końcu jeden z tych palantów podchodzi do jakiejś laski i bez słowa uderza ją w twarz. Panienka przewraca się na ziemię, on kopie ją, a nastepnie łapie za włosy i wyciąga na zewnątrz knajpy. I co Ty na to?"
            description: "Jak z uczuciami? Wiesz co to litość? Jesteś brutalny czy delikatny? Co sądzisz o przemocy? Zabiłeś już kogoś czy nie? Masz jakieś zasady morlane? No jak, co z Tobą?"
            width: creationForm.width-10
        }

        Question {
            id: question4
            question: "Zamieszanie się kończy, sączysz piwo, cicha muzyka uspokaja Cię. Wracasz wspomnieniami do dawnych dni, do czasów młodości. Wspominasz rodzinę..."
            description: "Jakie masz nastawienie do tradycji i rodziny? Co sądzisz o swoim ojcu i matce? Masz rodzeństwo? Jesteś samotny czy może gdzieś daleko stąd ktoś na Ciebie czeka?"
            width: creationForm.width-10
        }

        Question {
            id: question5
            question: "Przypominają Ci się słowa Twojego ojca. Możesz je powtórzyć?"
            description: "Czy Twój ojciec, lub ktoś inny, bardzo dla Ciebie ważny, czegoś Cię nauczył? Zdradził Ci jakąś mądrość, prawdę życiową? Jest coś, za co go wyjątkowo szanujesz? Chciałbyś być taki jak on?"
            width: creationForm.width-10
        }

        Question {
            id: question6
            question: "Nagle spokój zostaje brutalnie przerwany hukiem wystrzału. Ktoś kogoś postrzelił, teraz wychodzą na zewnątrz, słychać krzyki, jeszcze jeden huk wystrzału. Ktoś własnie kopnął w kalendarz. Dobrze, że to nie Ty, co?"
            description: "Boisz się śmierci? Jak reagujesz w sytuacjach niebezpiecznych? Mięknie Ci rura czy dalej jesteś hardy? Myślisz czasami o końcu? Masz jakiś cel, który chciałbyś osiągnąć zanim wyciągniesz kopyta?"
            width: creationForm.width-10
            height: question6.height + 5
        }
    }
}

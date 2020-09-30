const deutsch = document.getElementById("deutsch");
const powi = document.getElementById("powi");
const mathe = document.getElementById("mathe");
const englisch = document.getElementById("englisch");
const geschichte = document.getElementById("geschichte");
const physik = document.getElementById("physik");
const spanisch = document.getElementById("spanisch");
const ethik = document.getElementById("ethik");
const chemie = document.getElementById("chemie");
const franzoesisch = document.getElementById("franzoesisch");
const religionEv = document.getElementById("religion-ev");
const biologie = document.getElementById("biologie");
const kunst = document.getElementById("kunst");
const religionKath = document.getElementById("religion-kath");
const informatik = document.getElementById("informatik");
const musik = document.getElementById("musik");
const darstellendesSpiel = document.getElementById("darstellendes-spiel");



class Fachbereich {
    constructor(bereiche) {
        this.bereiche = bereiche;
    }

    checkBereiche() {
        var returnVal = true;
        this.bereiche.forEach(e => {
            if (!e.checkPattern()) returnVal = false;
        });
        return returnVal;
    }
}

class Bereich {
    constructor(classes, pattern) {
        this.pattern = pattern;
        this.classes = [];
        classes.forEach(e => {
            this.classes.push(new Class(e.id, e.checked));
        });
    }
    

    checkPattern() {
        if (this.pattern.pattern == 1) {
            var returnVal = true;
            this.classes.forEach(e => {
                if (!e.chosen) returnVal = false;
            });
            return returnVal;
        } else if (this.pattern.pattern == 2) {
            var oneClassChosen = false;
            returnVal = true;
            this.classes.forEach(e => {
                if (oneClassChosen && e.chosen) returnVal = false;
                if (e.chosen) oneClassChosen = true;
            });
            return (oneClassChosen && returnVal);
        } else if (this.pattern.pattern == 3) {
            var oneClassesChosen = false;
            var twoClassesChosen = false;
            returnVal = true;

            this.classes.forEach(e => {
                if (twoClassesChosen && e.chosen) returnVal = false;
                if (!twoClassesChosen && oneClassesChosen && e.chosen) twoClassesChosen = true;
                if (!twoClassesChosen && !oneClassesChosen && e.chosen) oneClassesChosen = true;
            });
            return (twoClassesChosen && returnVal);
        }
    }
}

class Class {
    constructor(name, chosen) {
        this.className = name;
        this.classChosen = chosen;
    }

    get name() {
        return this.className;
    }

    get chosen() {
        return this.classChosen;
    }
}

class Pattern {
    constructor(amountOfClassesPossible) {
        switch (amountOfClassesPossible) {
            case 1:
                this.ONE_POSSIBLE = true;
                break;

            case 2:
                this.TWO_POSSIBLE = true;
                break;
        
            case "all":
                this.ALL_POSSIBLE = true;
                break;

            default:
                break;
        }
    }

    get pattern() {
        if (this.ALL_POSSIBLE) return 1;
        if (this.ONE_POSSIBLE) return 2;
        if (this.TWO_POSSIBLE) return 3;
        return 0;
    }
    
}



// Fachbereich   = Eine kollektion von Bereichen, hat eine Methode, welche schaut, 
//                 ob alle Bereiche richtig gewählt worden sind.
//
// Bereich       = Eine kollektion von Kursen, man kann ein Pattern hinzufügen, welches steuert, 
//                 wie viele Kurse aus dem Bereich gewählt werden dürfen.

const setCookie = (cname, cvalue, exdays) => {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

const checkIfCourseSelectionIsValid = (e) => {
    e.preventDefault();
    const fachbereich1 = new Fachbereich([
        new Bereich([
            deutsch
        ], new Pattern(1)),
        new Bereich([
            englisch, spanisch, franzoesisch
        ], new Pattern(1)),
        new Bereich([
            kunst, musik, darstellendesSpiel
        ], new Pattern(1))
    ]);

    const fachbereich2 = new Fachbereich([
        new Bereich([
            powi, geschichte
        ], new Pattern("all")),
        new Bereich([
            ethik, religionEv, religionKath
        ], new Pattern(1))
    ]);

    const fachbereich3 = new Fachbereich([
        new Bereich([
            mathe
        ], new Pattern(1)),
        new Bereich([
            physik, chemie, biologie, informatik
        ], new Pattern(1))
    ])

    console.log(fachbereich1.checkBereiche(), fachbereich2.checkBereiche(), fachbereich3.checkBereiche())

    if (fachbereich1.checkBereiche() && fachbereich2.checkBereiche() && fachbereich3.checkBereiche()) {
        setCookie("kurswahl", "IRGENDWAS", 2);
        location.href = "./select-teachers.html";
    } else {
        alert("Fehler")
    }
    
}


document.getElementById("submit-btn").addEventListener("click", checkIfCourseSelectionIsValid);


const toggleHelpPopup = () => {
    console.log("HALSFAOIHSOFHEOFSA");
    var el = document.getElementById("help-popup");
    if (el.style.visibility == "visible") {
        el.style.visibility = "hidden";
    } else {
        el.style.visibility = "visible";
    }
}
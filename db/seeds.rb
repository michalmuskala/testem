# Users
User.create email: 'admin@testem.herokuapp.com', password: 'password', password_confirmation: 'password', admin: true
User.create email: 'user@testem.herokuapp.com', password: 'password', password_confirmation: 'password', admin: false

# Quiz
Quiz.create({
  name: 'Test z wosu',
  questions_attributes: [
    {
      text: 'Władza zwierzchnia w Rzeczypospolitej Polskiej należy, zgodnie z konstytucją do:',
      answers_attributes: [
        {
          text: 'narodu',
          correct: true
        },
        {
          text: 'prezydenta',
          correct: false
        },
        {
          text: 'parlamentu',
          correct: false
        },
      ]
    },
    {
      text: 'Źródłami powszechnie obowiązującego prawa Rzeczypospolitej Polskiej są m.in.',
      answers_attributes: [
        {
          text: 'ratyfikowane umowy międzynarodowe',
          correct: true
        },
        {
          text: 'zarządzenia',
          correct: false
        },
        {
          text: 'uchwały Sejmu i Senatu',
          correct: true
        },
      ]
    },
    {
      text: 'Akty prawa miejscowego',
      answers_attributes: [
        {
          text: 'mogą być wydawane wyłącznie przez organy samorządu terytorialnego',
          correct: true
        },
        {
          text: 'mogą być wydawane tylko na podstawie i w granicach upoważnień zawartych w ustawie',
          correct: true
        },
        {
          text: 'obowiązują jedynie na obszarze działania organu, który ten akt wydał',
          correct: true
        },
      ]
    },
    {
      text: 'Kto zarządza wybory do Senatu?',
      answers_attributes: [
        {
          text: 'Marszałek Senatu',
          correct: false
        },
        {
          text: 'Sąd Najwyższy',
          correct: false
        },
        {
          text: 'Prezydent RP',
          correct: true
        },
      ]
    },
    {
      text: 'Immunitet formalny polega na tym, że:',
      answers_attributes: [
        {
          text: 'posła nie można zatrzymać ani aresztować',
          correct: false
        },
        {
          text: 'przeciwko posłowi nie można prowadzić postępowania sądowego',
          correct: true
        },
        {
          text: 'poseł nie może być pociągnięty do odpowiedzialności za pewne czyny',
          correct: false
        },
      ]
    },
    {
      text: 'Inicjatywa ustawodawcza przysługuje m.in.',
      answers_attributes: [
        {
          text: 'Rzecznikowi Praw Obywatelskich',
          correct: false
        },
        {
          text: 'Prezydentowi RP',
          correct: true
        },
        {
          text: 'Trybunałowi Konstytucyjnemu',
          correct: false
        },
      ]
    },
    {
      text: 'Inicjatywa ustawodawcza w zakresie ustawy budżetowej, ustawy o prowizorium budżetowym, zmiany ustawy budżetowej, ustawy o zaciąganiu długu publicznego oraz ustawy o udzielaniu gwarancji finansowych przez państwo przysługuje wyłącznie:',
      answers_attributes: [
        {
          text: 'Sejmowi',
          correct: false
        },
        {
          text: 'Radzie Ministrów',
          correct: true
        },
        {
          text: 'Prezydentowi RP',
          correct: false
        },
      ]
    },
    {
      text: 'Uprawniony do zarządzenia referendum ogólnokrajowego jest m. in.',
      answers_attributes: [
        {
          text: 'Sejm na wniosek Prezydenta RP',
          correct: true
        },
        {
          text: 'Senat po zasięgnięciu opinii Sejmu',
          correct: false
        },
        {
          text: 'Prezydent RP za zgodą Senatu',
          correct: false
        },
      ]
    },
    {
      text: 'Uznania trwałej niezdolności Prezydenta RP do sprawowania urzędu ze względu na stan zdrowia dokonuje:',
      answers_attributes: [
        {
          text: 'Zgromadzenie Narodowe uchwałą podjętą większością co najmniej 2/3 głosów ustawowej liczby członków',
          correct: true
        },
        {
          text: 'Sejm uchwałą podjętą większością co najmniej 2/3 głosów ustawowej liczby posłów',
          correct: false
        },
        {
          text: 'Minister Zdrowia na wniosek Sejmu uchwałą podjętą większością co najmniej 2/3 głosów ustawowej liczby posłów',
          correct: false
        },
      ]
    },
    {
      text: 'Jedną z konstytucyjnych kompetencji Rady Ministrów jest:',
      answers_attributes: [
        {
          text: 'wydawanie rozporządzeń',
          correct: true
        },
        {
          text: 'promulgacja ustaw',
          correct: false
        },
        {
          text: 'prawo inicjatywy ustawodawczej',
          correct: true
        },
      ]
    },
    {
      text: 'Uchwałę o pociągnięciu członka Rady Ministrów do odpowiedzialności przed Trybunałem Stanu:',
      answers_attributes: [
        {
          text: 'podejmuje Sejm',
          correct: true
        },
        {
          text: 'podejmuje Prezes Rady Ministrów',
          correct: false
        },
        {
          text: 'podejmuje Prezydent RP',
          correct: false
        },
      ]
    },
    {
      text: 'Zgodnie z konstytucją postępowanie sądowe musi być co najmniej:',
      answers_attributes: [
        {
          text: 'jednoinstancyjne',
          correct: false
        },
        {
          text: 'dwuinstancyjne',
          correct: true
        },
        {
          text: 'trzyinstancyjne',
          correct: false
        },
      ]
    },
    {
      text: 'Przed Trybunałem Stanu odpowiedzialność ponoszą (chociażby w ograniczonym zakresie) m.in.:',
      answers_attributes: [
        {
          text: 'ministrowie ',
          correct: true
        },
        {
          text: 'posłowie',
          correct: false
        },
        {
          text: 'senatorowie',
          correct: false
        },
      ]
    },
    {
      text: 'Konstytucja Rzeczypospolitej Polskiej weszła w życie:',
      answers_attributes: [
        {
          text: '2 kwietnia 1997',
          correct: true
        },
        {
          text: '16 lipca 1997',
          correct: false
        },
        {
          text: '17 października 1997',
          correct: false
        },
      ]
    }
  ]
})

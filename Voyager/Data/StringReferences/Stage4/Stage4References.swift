//
//  Stage4References.swift
//  Voyager
//
//  Created by admin on 28.11.2023.
//

import Foundation

struct Stage4PreviewReference: PhraseDelegate {
    static let shared = Stage4PreviewReference()
    private init() {}
    
    private let text0 = PhraseData(
        text: "Тебе удалось переехать из комнатки на квартиру к одному владельцу, который при встрече дал понять, что тебя знает. Ты опять попал в неловкую ситуацию, твой забытый друг не спешил что-то конкретное говорить, но ты плыл по течению и пытался вызнать о своей прошлой жизни как можно больше.",
        type: .common
    )
    
    private let text1 = PhraseData(
        text: "- Знаешь, когда мы с тобой начинали учиться, мне казалось, что мы занимаемся такими интересными вещами. Мне безумно хотелось знать, как всё это можно использовать в жизни. Вон Стив Джобс использовал представления о религиозных догмах и положениях, чтобы строить и развивать Apple – у него получилось супер.",
        type: .interlocutor
    )
    
    private let text2 = PhraseData(
        text: "- Так а получилось ли у тебя? Ты сдаёшь мне небольшую квартирку, сам, наверняка, тоже где-то ночуешь, значит, не совсем безнадёжно твоё положение.",
        type: .mc
    )
    
    private let text3 = PhraseData(
        text: "- А что тогда нужно?",
        type: .interlocutor
    )
    
    private let text4 = PhraseData(
        text: "- А ты не видишь? Вон мне что дали? Распоряжаюсь негласным общаком своей семинарии, проверяю всё, обслуживаю, держу в состоянии доходности. Это ты решил варить свой астральный проект, у тебя было достаточно идей для этого, да к тому же амбиций и сил. Я к таким поступкам не готов совершенно: тут тебе и риски оказаться без башки, если батюшки прознают, и риски оказаться на зоне, если прознают майоры. Да и мало ли ещё чего? Свои же послушники могут принести в жертву собственным несформированным фантазиям – срежут тебе скальп во имя какого-нибудь ацтекского бога, про которого они прочитали в журнале “Наука и религия”. Короче, всё это от лукавого, да и даже у тебя что-то не получилось, если ты сейчас ищешь скромное пристанище без заключения договора. Живёшь под фальшивыми документами? И чужим именем? Тогда вряд ли можно сказать, что ты со своим религиозным суррогатом пришёл к успеху.",
        type: .mc
    )
    
    private let text5 = PhraseData(
        text: "Тут тебя осенило. Ты сумел купить симкарту на свои документы, но это ещё не значило, что они подлинные. Но вот если это фальшифка, где же документы настоящие?",
        type: .common
    )
    
    private let text6 = PhraseData(
        text: "- Слушай, ты мне не подскажешь, как можно проверить свои данные на предмет судебных разбирательств и уголовных преследований? Я не разбирался никогда в этих вопросах.",
        type: .mc
    )
    
    private let text7 = PhraseData(
        text: "- У тебя свои документы целы, при себе?",
        type: .interlocutor
    )
    
    private let text8 = PhraseData(
        text: "- Нет.",
        type: .mc
    )
    
    private let text9 = PhraseData(
        text: "-… интересно конечно. Что-нибудь могу спросить у особо верующих полицаев низшего звена, они могут и помочь своему дьячку, пусть даже я спрошу про тебя. Но мне нужна услуга взамен. Дай мне денег за несколько месяцев жизни здесь вперёд, и тогда я всё сделаю. Согласен?",
        type: .interlocutor,
        answerPositive: "Да.",
        answerNegative: "Нет.",
        hasAnswers: true
    )
    
    var phrases: [PhraseData] {
        return [text0, text1, text2, text3, text4, text5, text6, text7, text8, text9]
    }
}

//let f = """
//
//
//
//
//
//
//
//
//
//
//
//
//Варианты:
//1) Да. Игрок вкладывает деньги, взамен получает сведения, что ГГ в розыске по делу о вымогательстве под неопределённым предлогом. Восстанавливать настоящие документы нет резона, а ментов стоит опасаться и впредь. Может подключиться способность “настороженность”, которая даёт +% удачного исхода к рискованным моментам в игре.
//2) Нет. Игрок сохраняет деньги, не проплачивает жильё вперёд, не узнаёт о себе прошлом ничего, способность “настороженность” не включается.
//
//"""

struct Stage4LotteryExpensiveReference: PhraseDelegate {
    static let shared = Stage4LotteryExpensiveReference()
    private init() {}
    
    private let text0 = PhraseData(
        text: "Неожиданно произошло совершенно новое событие в твоей  жизни полунищего шулера – у тебя попросили в долг. Это был напёрсточник. Он сказал, что его старшим больше не интересно пасти его игры для маргиналов, отбросов и алконавтов, так что ему пришла пора измениться, или умереть.",
        type: .common
    )
    
    private let text1 = PhraseData(
        text: "Теперь он занимается фальсификациями, то есть оформлением документов для участия в розыгрышах и конкурсах на тендеры. Суть проста: компания “Наши люди” выигрывает тендер, скажем, на реконструкцию кинотеатра, спустя несколько месяцев туда приезжает проверяющая комиссия, а на месте ничего нет. Но деньги освоены, их уже не вернуть. И теперь его задача – подготавливать всё так, чтобы было гладко, и без подозрений.",
        type: .common
    )
    
    private let text2 = PhraseData(
        text: "- Тут, короче, совсем мелкое дело, мне его братки подкинули, чтобы я потренировался. Розыгрыш автомобилей немецких, я готовлю файлы участников. Я уже зарегистрировал подставные профили, но места для конкурсантов ещё остаются. Если хочешь, я могу тебя подрубить, только нужно дать сумму на оформление в твоём случае, так сказать минималку. Это подороже, чем билет в лотерее, но зато ты сможешь выиграть дорогую машину, сразу продать её и жить потом спокойно несколько месяцев.",
        type: .interlocutor
    )
    
    private let text3 = PhraseData(
        text: "- Так а что братки? Они же казнят тебя за такие проделки.",
        type: .mc
    )
    
    private let text4 = PhraseData(
        text: "- Во-первых, по их меркам конкурс неважный, а во-вторых, там ведь будут реальные конкурсанты кроме тебя, представители компаний холдинга, лучшие менеджеры среднего звена. Это делается для них. Если выиграешь ты, то братки решат, что машина досталась какому-то чуваку из числа настоящих участников, а не левых.",
        type: .interlocutor
    )
    
    private let text5 = PhraseData(
        text: "- А если проиграю?",
        type: .mc
    )
    
    private let text6 = PhraseData(
        text: "- Сумму за оформление не вернуть. Я вообще хотел в долг попросить, чтобы сыграть так самостоятельно, но, раз вот мы с тобой говорим об этом, то я могу оформить тебя за твой счёт, а ты мне потом с продажи дашь часть денег, за то, что я тебе так удачно подкинул возможность. Согласен?",
        type: .interlocutor,
        answerPositive: "Да.",
        answerNegative: "Нет.",
        hasAnswers: true
    )
    
    var phrases: [PhraseData] {
        return [text0, text1, text2, text3, text4, text5, text6]
    }
}

//let f = """
//
//
//
//
//
//
//
//
//1) Да. Игрок тратит часть денег, в итоге может выиграть существенный бонус, но не такой большой, как обещалось, так как братки обо всём узнают, и попросятся в долю. Чудес не бывает.
//2) Нет. Игрок ничего не тратит, но и не участвует в этой лотерее.
//
//"""


struct Stage4InvestReference: PhraseDelegate {
    static let shared = Stage4InvestReference()
    private init() {}
    
    private let text0 = PhraseData(
        text: "Дело было в баре, где спортсмен обычно разговаривает о ставках на всё заведение. Он встречался с каким-то знакомым лощёного внешнего вида, тот ему пытался предложить новый вид умножения денег.",
        type: .common
    )
    
    private let text1 = PhraseData(
        text: "- Да чего ты мне рассказываешь, будто я сам не знаю? Тут ведь как у меня в футболе – нужно знать всё вдоль и поперёк, чтобы выигрывать. Ну и я тебе подниму, если в твои бумаги не в зуб ногой?",
        type: .interlocutor
    )
    
    private let text2 = PhraseData(
        text: "- Так возьми да разберись. Тебе сложно прочитать документацию молодой… хотя да, тебе сложно прочитать. Так нет, а куда ты деньги тогда кладёшь? В банки? Там всё обесценивает инфляция.",
        type: .interlocutor
    )
    
    private let text3 = PhraseData(
        text: "- Я могу вложиться в валюту.",
        type: .interlocutor
    )
    
    private let text4 = PhraseData(
        text: "- И курс станет другим в самый неудобный момент.",
        type: .interlocutor
    )
    
    private let text5 = PhraseData(
        text: "- Я могу купить металлы, золото.",
        type: .interlocutor
    )
    
    private let text6 = PhraseData(
        text: "- А потом наколоться на спредах. Говорю я тебе, нужно оперировать чем-то менее очевидным, но куда более развивающимся и живым.",
        type: .interlocutor
    )
    
    private let text7 = PhraseData(
        text: "- Не, я всажу всё, спасибо. Может быть, в другой жизни.",
        type: .interlocutor
    )
    
    private let text8 = PhraseData(
        text: "Ты всё это слушал и думал - не пора ли тебе сделать вклад? Собеседник спортсмена заметил твой интерес.",
        type: .common
    )
    
    private let text9 = PhraseData(
        text: "- Есть свободные деньги для вкладов, молодой человек?",
        type: .interlocutor
    )
    
    private let text10 = PhraseData(
        text: "- А есть вклады, где дело верное?",
        type: .mc
    )
    
    private let text11 = PhraseData(
        text: "- Хм, если деньги нужны срочно, то это стартапы, их акции. Нужно понимать, что именно выстрелит, что попадёт в запрос рынка.",
        type: .interlocutor
    )
    
    private let text12 = PhraseData(
        text: "- Так вы в теме давно, посоветуете что-либо, может?",
        type: .mc
    )
    
    private let text13 = PhraseData(
        text: "- Вообще да, есть проекты, за которыми я слежу особо внимательно. Можете вложиться по моему указанию, рекомендации. Например, в корпуса для мобильников, в которых будет элемент, блокирующий излучение, чтобы не было потом проблем со здоровьем. Вроде как гринписовцы должны поддержать, раскрутить эту тему. Готовы рискнуть?",
        type: .interlocutor,
        answerPositive: "Да.",
        answerNegative: "Нет.",
        hasAnswers: true
    )
    
    var phrases: [PhraseData] {
        return [text0, text1, text2, text3, text4, text5, text6, text7, text8, text9, text10, text11, text12, text13]
    }
}

//let f = """
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//1) Да. ГГ вкладывается, получает среднюю прибыль на первом этапе (типо стартап выстрелил), получает высокую прибыль на втором этапе (дела у компании идут хорошо), прогорает на третьем этапе (гринписовцы переключились на другой инфоповод, а Китай отказался покупать права на технологию, так как с ней делать смартфоны дешёвыми не получится).
//2) Нет. ГГ не вкладывает деньги, прибыли тоже нет.
//
//"""

struct Stage4SlotReference: PhraseDelegate {
    static let shared = Stage4SlotReference()
    private init() {}
    
    private let text0 = PhraseData(
        text: "- Автомат? Ты серьёзно?",
        type: .mc
    )
    
    private let text1 = PhraseData(
        text: "- А чего ты в этом видишь такого? Это же казино.",
        type: .interlocutor
    )
    
    private let text2 = PhraseData(
        text: "- Мне казалось, их запретили законом, когда люди стали закладывать квартиры и пропадать.",
        type: .mc
    )
    
    private let text3 = PhraseData(
        text: "- Дурачки всегда найдутся и все деньги слить всегда сумеют, это не показатель. По поводу запретов я слышал, но это было давно, а сейчас уж и автоматы другие. Кто их знает, эти законы, что там попадает под запрет, а что нет?",
        type: .interlocutor
    )
    
    private let text4 = PhraseData(
        text: "- И чего нам делать? Запускать монетки до тех пор, пока не спрыгнет джекпот? Не похоже на стоящее занятие.",
        type: .mc
    )
    
    private let text5 = PhraseData(
        text: "- Их отдел в игральном доме только открывают. Сейчас там не будет никаких блокировок, а возможно даже шанс выигрыша будет повышен, ведь владельцы хотят привлечь игроков.",
        type: .interlocutor
    )
    
    private let text6 = PhraseData(
        text: "- А ты сам пойдёшь, или как обычно?",
        type: .mc
    )
    
    private let text7 = PhraseData(
        text: "- Чего обычно? Пойду я, конечно. Пошли вместе, вдруг ты выиграешь с первой монетки.",
        type: .interlocutor
    )
    
    var phrases: [PhraseData] {
        return [text0, text1, text2, text3, text4, text5, text6, text7]
    }
}

struct Stage4BettingWColleaguesReference: PhraseDelegate {
    static let shared = Stage4BettingWColleaguesReference()
    private init() {}
    
    private let text0 = PhraseData(
        text: "Ты сидишь в баре со спортсменом",
        type: .common
    )
    
    private let text1 = PhraseData(
        text: "-… если у тебя всё так, как ты говоришь, я понять не могу, каким образом ты вообще держишься, да ещё и выходишь в плюс.",
        type: .interlocutor
    )
    
    private let text2 = PhraseData(
        text: "- Погоди, ты же именно этих людей и подключаешь к системе? Или ты мне просто сказал так, чтобы я от тебя отстал?",
        type: .mc
    )
    
    private let text3 = PhraseData(
        text: "- Да понятное дело, что здесь все участники рискуют и всегда уповают на волю случая. Но я не мог представить прежде, что какой-то случайный прохожий с дырявой башкой сможет поиграть во всё, и почти везде выиграть. Будто бы судьба расплачивается с тобой за какое-то бедствие, огромное невезение, которое выпало тебе прежде. И теперь твоя удачливость вроде как выстрадана – огромный запас фарта.",
        type: .interlocutor
    )
    
    private let text4 = PhraseData(
        text: "- Мне не кажется, что я столь удачлив. Просто я всегда понимаю, что отступать мне попросту некогда, так что вот приходится ставить с умом.",
        type: .mc
    )
    
    private let text5 = PhraseData(
        text: "- Предлагаю тогда воспроизвести рисковое и безбашенное пари из известного фильма: ты берёшь свежую зажигалку и пытаешься зажечь огонь 9 раз подряд, то есть тебе нужно 9 успешных попыток в заходе. Если ты сумеешь, я возьму тебя в наши дела, сможешь быть на стабильном доходе, это что-то вроде работы, а не разовых заработков, как сейчас у тебя. Если ты не сумеешь, официант отрежет тебе мезинец, который мы сразу же кинем в лёд и отправим в скорую вместе с тобой, пришивать. Ты хотел ведь пробиться к нам, так?",
        type: .interlocutor
    )
    
    private let text6 = PhraseData(
        text: "- Да, хотел, я прошёл через всё и не могу больше ждать.",
        type: .mc
    )
    
    var phrases: [PhraseData] {
        return [text0, text1, text2, text3, text4, text5, text6]
    }
}

//let f = """
//Парри с коллегами
//(Диалог в баре со спортсменом)
//
//
//
//
//
//
//
//
//
//
//1) Победа – продвижение по сюжету с пальцем, без потери здоровья.
//2) Поражение – ГГ теряет палец, его отправляют в больницу. После паузы на лечение предлагается повторить спор. ГГ говорит, что, с одной стороны, цена поражения велика, и он уже проиграл один раз, но с другой, он устал перебиваться несерьёзными заработками и стоять на месте, он готов менять свою жизнь во что бы то ни стало. Тогда спортсмен отвечает, что не будет проверять его удачливость во второй раз -  он хотел лишь убедиться в решимости и серьёзном настрое, а также готовности жертвовать ради большой игры.
//
//"""
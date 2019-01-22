defmodule CatechismPages do
  def start_link, do: Agent.start_link(fn -> build() end, name: __MODULE__)
  def identity(), do: Agent.get(__MODULE__, & &1)

  def build do
    [
      page1: [
        title: "TO BE A CHRISTIAN",
        description: "An Anglican Catechism"
      ],
      page2: [
        title: "CONTRIBUTORS",
        underline: "Anglican Church in America Catechesis Task Force",
        list: [
          "Mr. Kirk Botula",
          "Mrs. Taryn Bullis",
          "Rev. Brian Foos",
          "Rev. Dr. Jack Gabig",
          "Dr. Philip Harrold",
          "Mrs. Kristy Leaseburg",
          "Rev. Lee Nelson",
          "Rev. Canon Dr. JI Packer",
          "Rev. Dr. Joel Scandrett",
          "Mrs. Bronwyn Short"
        ],
        underline: "Writers/Consultants",
        list: [
          "Rev. John Boonzaaijer",
          "Rev. Dr. Susan Bubbers",
          "Rev. Dr. Charles Erlandson",
          "Rev. Randall Foster",
          "Rev. Mark Galli",
          "Dr. Sarah Lebhar Hall",
          "Rev. Dr. Toby Karlowicz",
          "Rt. Rev. Neil Lebhar",
          "Rt. Rev. Dr. Francis Lyons",
          "Very Rev. Dr. Robert Munday",
          "Very Rev. Dr. Stephen Noll",
          "Rev. Dr. Ann Paton",
          "Very Rev. Dr. Justyn Terry",
          "Dr. William Witt"
        ]
      ],
      page3: [
        title: "INTRODUCTION",
        paragraphText: """
        Two thousand years ago in Israel, the man who is God incarnate, Jesus of Nazareth, led his
        followers into a life-giving relationship with himself and his divine Father, and was executed for
        being a revolutionary. Risen from the dead, he charged his followers to make disciples throughout
        the whole world, promising that he would be with them and equipping them for their mission with
        his Holy Spirit. The New Testament presents the essential witness and teaching of Jesus’ first
        emissaries, the Apostles, who proclaimed his truth with his authority. The faith of Christians today,
        as in every age, is shaped and defined by this apostolic account of Jesus Christ.
        """,
        paragraphText: """
        Within a century of Jesus’ earthly ministry, Christian congregations could be found from Spain to
        Persia, and from North Africa to Britain. By this time, the catechumenate for would-be Christians
        (from the Greek katecheo: “to instruct” – a period of 1-3 years’ instruction leading to baptism at
        Easter) had become established Christian practice. This pattern of Christian disciple-making
        continued for some centuries before falling into disuse, as nominal Christianity increasingly became
        a universal aspect of Western culture.
        """,
        paragraphText: """
        The Reformation era saw a vigorous renewal of catechesis (instruction within the catechumenate) for
        both adults and children among both Protestants and Catholics. But catechesis has been in serious
        decline since the eighteenth century, and much of the discipline of discipling has been abandoned
        altogether in today’s churches.
        """,
        paragraphText: """
        This catechism (a text used for instruction of Christian disciples) is designed as a resource manual for
        the renewal of Anglican catechetical practice. It presents the essential building blocks of classic
        catechetical instruction: the Apostles’ Creed, the Lord’s Prayer, and the Ten Commandments (the
        Decalogue). To these is added an initial section especially intended for those with no prior
        knowledge of the Gospel. Each section is presented in the question-and-answer form that became
        standard in the sixteenth-century because of its proven effectiveness. Each section is also set out
        with its practical implications, together with biblical references. The next printing will also include
        teaching notes for catechists (instructors). 
        """
      ],
      page4: [
        paragraphText: """
        In one respect, this catechism breaks new ground for Anglicans. The historic Catechism in the
        English Book of Common Prayer is brief, and specifically designed to prepare young people for
        confirmation and church membership. However, this present work is intended as a more
        comprehensive catechetical tool for all adult (or near-adult) inquirers, and for all Christians seeking
        deeper grounding in the full reality of Christian faith and life.
        """,
        paragraphText: """
        As such, this catechism attempts to be a missional means by which God may bring about both
        conversion to Christ and formation in Christ (or regeneration and sanctification, to use older
        words). This vision of comprehensive usefulness has been before the minds of the writing team
        from the beginning.
        """,
        paragraphText: "Our guidelines in drafting have been:",
        ordered_list: [
          """
          1. Everything taught should be compatible with, and acceptable to, all recognized schools of
                Anglican thought, so that all may be able confidently to use all the material.
          """,
          """
          2. Everything taught should be expressed as briefly as possible, in terms that are clear and
          correspond to today’s use of language. There should be as little repetition as possible, though
          some overlap is inevitable.
          """,
          """
          3. All the answers and questions should be as easy to explain and to remember as possible.
          We offer this catechism to the Church with the prayer that it may serve to build up the Body of
          Christ by helping many to full Christian faith and faithfulness in today’s increasingly post-Christian
          world.
          """
        ],
        paragraphText: "On behalf of the ACNA Catechesis Task Force,",
        paragraphText: "JI Packer "
      ],
      page5: [
        title: "LETTER OF COMMENDATION",
        title: "FROM THE COLLEGE OF BISHOPS",
        title: "OF THE ANGLICAN CHURCH IN NORTH AMERICA",
        paragraphText: """
        Why an Anglican catechism? Anglicans are heirs of a rich tradition of Christian faith and life. That
        tradition stretches from today’s worldwide Anglican Communion of millions of believers on six
        continents back centuries to laymen like William Wilberforce, who led the abolition of the slave
        trade in England, to the bishops and martyrs of the English Reformation like Thomas Cranmer, and
        to missionaries like Augustine of Canterbury and St. Patrick, who spread the Gospel throughout the
        British Isles.
        """,
        paragraphText: """
        Throughout these centuries, Anglicans have articulated their faith in reference to classic sources of
        doctrine and worship. These include:
        """,
        list: [
          """
            • The Bible – All true doctrine, Anglicans believe, is derived from the Bible. St. Paul instructs
          the Church, “All Scripture is breathed out by God and profitable for teaching, for reproof,
          for correction, and for training in righteousness” (2 Timothy 3:16). Further, Article 6 of the
          Articles of Religion states: “whatever is not read therein, nor may be proved thereby, is not
          to be required of any man that it should be believed as an article of the Faith.”
          """,
          """
          • The Early Church – Anglicans have always held in high regard “such teachings of the ancient
          Fathers and Councils of the Church as are agreeable to the Scriptures,” and which are
          summarized in the Apostles’ Creed, Nicene-Constantinopolitan Creed, and Athanasian
          Creed.
          """,
          """
          • The Articles of Religion (1563) – The Articles, also known as the “Thirty-Nine Articles,”
          summarize the biblical faith recovered at the Reformation and have become the doctrinal
          norm for Anglicans around the world.
          """,
          """
          • The King James Bible (1611) – The translation of the Bible into English, begun in the 16th
          century by William Tyndale, achieved its classic form in the 1611 translation and remains the 
          basis for many modern versions, such as the Revised Standard Version and the English
          Standard Version. In keeping with the principles of the English Reformation that promote
          speaking in language that the people understand (Articles of Religion, 24), the Bible has been
          translated into many languages. Anglican Christianity has now spread to encompass people
          of many races and languages all over the world.
          """
        ]
      ],
      page6: [
        list: [
          """
          • The Book of Common Prayer (1549-1662) – The Anglican Prayer Book is known worldwide
          as one of the finest expressions of Christian prayer and worship. The 1662 Prayer Book is
          predominantly comprised of scriptures formulated into prayer. It has been the standard for
          Anglican doctrine, discipline and worship, and for subsequent revisions in many languages.
          """,
          """
          • Music and Hymnody – Hymns, from writers like Isaac Watts, Charles Wesley, John Mason
          Neale and Graham Kendrick, have formed the spirituality of English speaking Anglicans
          around the world. Today, composers in many languages continue in this powerful tradition
          of catechesis through music.
          """,
          """
          • The Lambeth Quadrilateral – Resolution 11 of the Lambeth Conference (1888) affirmed
          four marks of Church identity required for genuine unity and fellowship. These are: the Holy
          Scriptures containing “all things necessary for salvation,” the Apostles’ and Nicene Creeds as
          “the sufficient statement of the Christian faith,” two sacraments ordained by Christ –
          Baptism and the Eucharist – and “the historic Episcopate, locally adapted.” These serve as a
          basis of Anglican identity as well as instruments for ecumenical dialogue with other church
          traditions.
          """,
          """
          • The Jerusalem Declaration (2008) – This statement from the Global Anglican Future
          Conference in 2008 has become the theological basis for the Global Fellowship of
          Confessing Anglicans, of which the Anglican Church in North America is a part.
          """
        ],
        paragraphText: """
          In keeping with this rich and historic tradition of doctrine and worship, we receive this catechism
          and commend its use for the building up of the Church today.
        """
      ],
      page7: [
        paragraphText: """
          We envision this catechism being used for courses, shorter or longer, based on groups of questions
          and answers. The degree to which it is used directly for instruction, and the amount of
          memorization asked of individual catechumens, is left to the catechist to determine by context and
          circumstance. What is more, the resources of modern technology open up multiple possibilities for
          its use in creative new ways.
        """,
        paragraphText: """
          A catechism is ideally to be used in the context of a relationship between the catechist (the
          discipleship instructor) and the catechumen (the one being instructed) to foster the process of
          catechesis (disciple-making). The catechumen is invited by the catechist to a new identity in Christ
          and into a new community, to the praise of God’s glory, the practice of stewardship, and to sharing
          in the ministry of making disciples of all nations.
        """,
        paragraphText: """
          May this book serve to build up the Body of Christ, by grounding Anglican believers in the Gospel.
          The Most Reverend Robert Duncan, DD
          Archbishop of the Anglican Church in North America
          On behalf of the College of Bishops,
          January 2014
        """
      ],
      page8: [
        center: [
          paragraphText: """
            O God, who wonderfully created, and yet more wonderfully
            restored, the dignity of human nature: Grant that we may share
            the divine life of him who humbled himself to share our
            humanity, your Son Jesus Christ; who lives and reigns with
            you, in the unity of the Holy Spirit, one God, for ever and
            ever. Amen
          """
        ]
      ],
      page9: [
        title: "PART I: BEGINNING WITH CHRIST",
        section: "Introduction",
        paragraphText: """
        This Catechism is designed to make clear to everyone what it means to be a Christian. It lays out
        what is essential for Christian faith and life. It will open for you the door to knowing Jesus Christ
        and experiencing the full love of God through him. It will lead you to full involvement in the life
        and mission of the Church, as you become a citizen of the Kingdom of God. And it will anchor you
        in the full reality of unquenchable joy, beginning in this life and ever increasing in the life to come.
        """,
        paragraphText: """
        However, one can know about these things and yet remain apart from them. In order not to miss
        what God is offering you, it is imperative that you receive Jesus Christ as your own Savior and Lord
        – if you have not already done so – and commit yourself to him to be his lifelong disciple. This
        opening section of the Catechism focuses on helping you to take this step, and when you have done
        it, to know that you have done it, so that you may go on from there.
        """,
        paragraphText: """
        To be a Christian is a lifelong commitment, but it begins with becoming a Christian in a conscious
        way, just as being a spouse begins with taking marriage vows. Being a Christian is a process of
        advance from that point. As you continue with Christ, with his Father as your Father, his Holy Spirit
        as your helper and guide, and his Church as your new family, you will constantly be led deeper into
        your born-again calling of worship, service, and Christ-like relationships.
        """,
        section: "The Gospel",
        paragraphText: """
        You need to be clear from the beginning that God creates human beings for intimacy with himself;
        but no one naturally fulfills this purpose. We are all out of step with God. In Bible language, we are
        sinners, guilty before God and separated from him. Life in Christ is, first and foremost, God taking
        loving action to remedy a dire situation.
        """,
        paragraphText: """
          The key facts of this divine remedy, which the Bible calls the Gospel (meaning “good news”), are
          these: God the Father sent his eternal Son into this world to reconcile us sinners to him, and to
          preserve and prepare us for his glory in the life to come. Born of the Virgin Mary through the Holy
          Spirit, the Son, whose human name is Jesus, lived a perfect life, died a criminal’s death as a sacrifice
          for our sins, and rose from the grave to rule as Christ (meaning “the Anointed”) on his Father’s
          behalf in the Kingdom of God. Now reigning in heaven, he continues to draw sinners to himself 
        """
      ],
      page10: [
        paragraph: """
          through communication of the Gospel here on earth. He enables us by the Holy Spirit to turn
          whole-heartedly from our sinful and self-centered ways (repentance) and to entrust ourselves to him
          to live in union and communion with him (faith). In spiritual terms, self-centeredness is the way of
          death, and fellowship with Christ is the way of life. Holy Baptism, the rite of entry into the Church’s
          fellowship, marks this transition from death to life in Christ. The Apostle Peter said, as he
          proclaimed the Gospel on Pentecost morning: “Repent and be baptized every one of you in the
          name of Jesus Christ for the forgiveness of your sins, and you will receive the gift of the Holy Spirit.
          For the promise is for you and for your children and for all who are far off, everyone whom the
          Lord our God calls to himself”
        """,
        ref: "Acts 2:38-39",
        paragraph: [
          text: """
            God the Father calls us to himself through God the Son. Jesus said, “I am the way, and the truth,
            and the life. No one comes to the Father except through me” (John 14:6). As we come to the Father
            through Jesus Christ, we experience the unconditional and transforming love of God.
            God the Son calls us to believe in him. After Jesus was raised from the dead, one of his followers
            named Thomas said that he would only believe if he could see Jesus and touch his wounds. Jesus
            later appeared, held out his hands, and told Thomas to put his finger in the wounds. Thomas then
            exclaimed, “My Lord and my God”
          """,
          ref: "John 20:28",
          text: """
            ). We may understand a great deal about Jesus, as
            Thomas did before this encounter, but that is not the same as personally believing in Jesus as our
            Lord and God. We can attend church services and do many good things without knowing the risen
            Jesus. Knowing Jesus as Savior and Lord means personally believing in him, surrendering our lives
            to him, and living as his joyful followers.
          """
        ],
        paragraph: [
          text: """
            God the Holy Spirit enlightens our minds and hearts to believe in Jesus, and gives us spiritual birth
            and life as we do. Our loving Father will “give the Holy Spirit to those who ask him” (
          """,
          ref: "Luke 11:13",
          text: """
            ). As we place our faith in Jesus, the Holy Spirit comes to live in us and wonderfully provides us with
            power and gifts for life and ministry as Jesus’ disciples. To live faithfully as Christians we must rely
            upon the equipping and empowering of the Holy Spirit.
          """
        ],
        paragraphText: """
          The Father, the Son and the Holy Spirit are near to us at all times and will hear us whenever we pray
          with sincerity, truly meaning what we say. God calls us to repentance and faith in Christ, and a way
          to enter into life in Christ is to say a prayer like this – preferably in the presence of a mature
          Christian:
        """
      ],
      page11: [
        indent: [
          italic: "Prayer of Repentance and Faith",
          paragraphText: """
            Lord Jesus Christ, I confess my faults, shortcomings, sins, and rebellious acts, and ask you to
            forgive me. I embrace you, Lord Jesus, as my Savior and Lord. Thank you for your atoning
            death on the cross in obedience to your Father’s will to put away my sins. I enthrone you,
            Lord Jesus, to be in charge of every part of my life, and I ask you to indwell and empower
            me with your Holy Spirit, so that I may live as your faithful follower from now on. Amen.
          """
        ],
        paragraphText: """
          Inquirers who are on the road to faith, but know they are not yet ready to pray these words with full
          sincerity, may still be able to pray honestly along the following lines:
        """,
        indent: [
          italic: "Inquirer’s Prayer",
          paragraphText: """
            O God, my Creator, who sent your Son as the Way, the Truth and the Life to save me and
            all the world, I believe in your reality. Help my unbelief.
          """,
          paragraphText: """
            I long to understand all that it means to be loved, known, and forgiven by you, and to be
            made whole: at peace with you, others, myself, and your creation. I know I have sinned
            against you, others, myself, and the creation of which I am part.
          """,
          paragraphText: """
          Lord Jesus Christ, Son of God, have mercy on me, a sinner. Open my eyes to all that you
          are, and draw me closer to you, I pray. Amen.
          """
        ],
        paragraphText: """
         God will always answer honest prayer, made with patience, persistence, and humility.
         As you explore this Catechism, turn again and again to God in prayer, so that you will come to know
         him more and more. As you learn more about God the Father, you could pray a prayer like this:
        """,
        quoteText: """
          Gracious Father, I come to you through the saving work of Jesus Christ on the cross. Thank
          you for adopting me as your child through him. Grant me the grace to know you more fully
          as my heavenly Father, that I may enjoy the fullness of the promises of your eternal
          Kingdom; through Jesus Christ our Lord. Amen.
        """,
        paragraphText: """
          As you learn more about God the Son, you could pray a prayer like this:
        """
      ],
      page12: [
        quoteText: """
          Lord Jesus Christ, as I surrender to you as Lord of my life, draw me ever closer to you. Show
          me where I may I harbor resistance to your lordship and rejection of your will. Bring me into
          the greater joy of the abundant life that you desire for me, now and forever; through your
          holy Name. Amen.
        """,
        paragraphText:
          "As you learn more about God the Holy Spirit, you could pray a prayer like this:",
        quoteText: """
          Almighty God, thank you for giving me new life in Jesus Christ. I ask you to fill me afresh
          with your Holy Spirit. Bring forth in me the goodness and love of Jesus. Empower me to
          serve you in faith and obedience to Christ that I may always live for your glory; through
          Jesus Christ our Lord. Amen.
        """,
        paragraph: """
        In order to give clarity and further detail, and for the purposes of teaching and learning, these things
        will now be set out in question and answer form.
        """,
        section: "SALVATION",
        question: :question1,
        question: :question2,
        question: :question3,
        question: :question4,
        question: :question5
      ],
      page13: [
        question: :question6,
        question: :question7,
        question: :question8,
        question: :question9,
        question: :question10,
        question: :question11,
        question: :question12,
        question: :question13
      ],
      page14: [
        question: :question14,
        question: :question15,
        question: :question16,
        question: :question17,
        question: :question18
      ],
      page15: [
        title: "PART II: BELIEVING IN CHRIST",
        title: "THE APOSTLES’ CREED AND THE LIFE OF FAITH",
        paragraphText: """
          For Anglicans, as for all genuine Christians, authentic Christianity is apostolic Christianity. Apostolic
          Christianity rests on the historic, eyewitness testimony of Jesus’ followers, the apostles, to the facts
          of Jesus’ life, death, resurrection, ascension, present heavenly reign, and promised future return.
          Both Jesus and his apostles understood these facts to fulfill the Old Testament hopes of the
          Kingdom (or reign) of God, to which God’s covenant with Israel was intended to lead, and which
          the Christian Church has received as a reality from Jesus and his apostles.
        """,
        paragraphText: """
          Anglicans affirm that the Bible, the Old and New Testament together, is “God’s Word written”
          (Articles of Religion, 20), from which we learn these authoritative facts. By the second century, these
          key facts of apostolic faith had been organized into a syllabus of topics for catechetical teaching (the
          Rule of Faith), and this syllabus became the Apostles’ Creed—so called because it sums up the
          apostolic faith. In due course this Creed, one of three found now in the Prayer Book, took its place
          as the baptismal declaration used in the church at Rome and elsewhere. The earliest of the Creeds
          we acknowledge, it is the briefest and most easily memorized for purposes of catechesis, but is
          complemented and enlarged upon by the Nicene and Athanasian Creeds.
        """,
        paragraphText: """
          To gather and focus the central truths of the apostolic faith, as the Scriptures present them, is the
          first task of all catechesis. That is what the Apostles’ Creed does. It is arranged in three paragraphs
          or articles, which highlight in turn the person and work of the Father, the Son, and the Holy Spirit.
          Thus the Creed is Trinitarian, as is the New Testament itself. It is a curriculum of truths that leads
          inquirers into a focused and grounded personal faith in the Triune God, and into real discernment
          of the personal commitment such faith involves.
        """,
        paragraphText: """
          The Creed exists, as all Creeds and Confessions do, to define and defend this commitment that is
          basic to being a Christian. Its central article—which declares who and what Jesus Christ was, is and
          will be—is the fullest and longest; the article on God the Creator (the Father) introduces it, and the
          article on the Holy Spirit and the Christian salvation follows from it. As a whole, the Creed testifies
          to the vital core of God’s self-revelation. It is a consensus document, coming to us with the
          resounding endorsement of faithful believers over nearly two thousand years, for it has been recited 
          by Christian communities at all times and in all places throughout the history of the Christian
          Church. And it is a benchmark of orthodoxy, that is, of right belief, guiding our understanding of
          God’s revealed truth at points where our sin-clouded minds might go astray.
        """
      ],
      page16: [
        paragraphText: "Intentionally Blank"
      ],
      page17: [
        section: "ARTICLE I: FAITH IN GOD",
        section: "“I BELIEVE”",
        section: "Concerning the Creeds",
        question: :question19,
        question: :question20,
        question: :question21,
        question: :question22,
        question: :question23,
        question: :question24,
        question: :question25
      ],
      page18: [
        section: "Concerning Holy Scripture",
        question: :question26,
        question: :question27,
        question: :question28,
        question: :question29,
        question: :question30,
        question: :question31,
        question: :question32
      ],
      page19: [
        question: :question33,
        question: :question34,
        question: :question35,
        question: :question36,
        question: :question37,
        section: "“I BELIEVE IN GOD”",
        question: :question38
      ],
      page20: [
        question: :question39,
        section: "“THE FATHER ALMIGHTY”",
        question: :question40,
        question: :question41,
        question: :question42,
        question: :question43,
        section: "“CREATOR OF HEAVEN AND EARTH”",
        question: :question44
      ],
      page21: [
        question: :question45,
        question: :question46,
        question: :question47,
        question: :question48,
        section: "ARTICLE II: FAITH IN CHRIST",
        section: "“I BELIEVE IN JESUS CHRIST HIS ONLY SON”",
        question: :question49,
        question: :question50,
        question: :question51
      ],
      page22: [
        question: :question52,
        section: "“OUR LORD”",
        question: :question53,
        section: "“HE WAS CONCEIVED BY THE HOLY SPIRIT AND BORN OF THE VIRGIN MARY”",
        question: :question54,
        question: :question55,
        question: :question56
      ],
      page23: [
        section: "“HE SUFFERED UNDER PONTIUS PILATE”",
        question: :question57,
        question: :question58,
        question: :question59,
        section: "“WAS CRUCIFIED, DIED, AND WAS BURIED. HE DESCENDED TO THE DEAD”",
        question: :question60,
        question: :question61,
        question: :question62
      ],
      page24: [
        question: :question63,
        question: :question64,
        question: :question65,
        section: "“HE ASCENDED INTO HEAVEN”",
        question: :question66,
        question: :question67,
        section: "“AND IS SEATED AT THE RIGHT HAND OF THE FATHER”",
        question: :question68
      ],
      page25: [
        question: :question69,
        question: :question70,
        section: "“HE WILL COME AGAIN TO JUDGE THE LIVING AND THE DEAD.”",
        question: :question71,
        question: :question72,
        question: :question73,
        question: :question74
      ],
      page26: [
        question: :question75,
        question: :question76,
        question: :question77,
        question: :question78,
        question: :question79,
        question: :question80
      ],
      page27: [
        section: "ARTICLE III: FAITH IN THE HOLY SPIRIT",
        section: "“I BELIEVE IN THE HOLY SPIRIT”",
        question: :question81,
        question: :question82,
        question: :question83,
        question: :question84,
        question: :question85,
        question: :question86
      ],
      page28: [
        question: :question87,
        question: :question88,
        section: "“THE HOLY CATHOLIC CHURCH”",
        question: :question89,
        question: :question90,
        question: :question91,
        question: :question91,
        question: :question93
      ],
      page29: [
        question: :question94,
        question: :question95,
        question: :question96,
        section: "“THE COMMUNION OF SAINTS”",
        question: :question97,
        question: :question98,
        question: :question99,
        question: :question100
      ],
      page30: [
        question: :question101,
        sectioni: "CONCERNING SACRAMENTS",
        question: :question102,
        question: :question103,
        question: :question104,
        question: :question105,
        question: :question106,
        question: :question107
      ],
      page31: [
        question: :question108,
        question: :question109,
        question: :question110,
        question: :question111,
        question: :question112,
        question: :question113,
        question: :question114,
        question: :question115
      ],
      page32: [
        question: :question116,
        question: :question117,
        question: :question118,
        question: :question119,
        question: :question120,
        question: :question121,
        question: :question122,
        question: :question123
      ],
      page33: [
        question: :question124,
        question: :question125,
        question: :question126,
        question: :question127,
        question: :question128,
        question: :question129,
        question: :question130,
        question: :question131
      ],
      page34: [
        question: :question132,
        section: "“THE FORGIVENESS OF SINS”",
        question: :question133,
        question: :question134,
        question: :question135,
        question: :question136,
        question: :question137,
        question: :question138
      ],
      page35: [
        question: :question139,
        question: :question140,
        question: :question141,
        section: "“THE RESURRECTION OF THE BODY”",
        question: :question142,
        question: :question143,
        question: :question144,
        question: :question145,
        question: :question146
      ],
      page36: [
        section: "“AND THE LIFE EVERLASTING.”",
        question: :question147,
        question: :question148
      ],
      page37: [
        title: "PART III: BEING CHRIST’S",
        title: "THE CHRISTIAN LIFE AND THE LORD’S PRAYER",
        paragraphText: """
          The Gospel is God’s invitation to all people to come to know him, to spend this present life getting
          to know him better, and to love and serve him as members of his redeemed family. Thus we prepare
          for eternal life with God. For all Christians, therefore, communing with God becomes life’s central
          activity. Accordingly, once basic Christian beliefs have been set forth and learned, the next
          catechetical task is to explore the path of prayer. This is our God-given way of responding to the
          knowledge of God and his desires and purposes for us: entering through prayer into direct
          fellowship with him.
        """,
        paragraphText: """
          Christian prayer is best understood as our personal response to God’s Word. “O Lord, Thou didst
          strike my heart with Thy Word and I loved Thee,” St. Augustine wrote. Just as Anglican worship
          begins with the reading of Scripture followed by prayers, so our daily rule of life is to be patterned
          on Bible reading and prayer.
        """,
        paragraphText: """
          Prayer takes two primary forms. On the one hand, we speak to God on our own, apart from human
          company, as our Savior directed in his Sermon on the Mount (Matthew 6:6). On the other hand, we
          also pray in company, as part of a worshipping congregation, in any group that meets for prayer, and
          ideally also with family and friends. Here are two proven patterns for daily prayer: The first pattern
          is to follow, in whole or in part, the Morning and Evening prayer services prescribed in the Book of
          Common Prayer (the Daily Office). Many Anglicans do this. The second pattern, also widely used, is
          to follow the path marked out by the acronym ACTS – Adoration (of God, the Father, the Son and
          the Spirit); Confession (of sin); Thanksgiving (for all the good things received that day and every
          day, for answers to prayer, for blessings given to others); and Supplication (asking God to guide,
          help and protect oneself and others, and to supply specific needs).
        """,
        paragraph: [
          text: """
            Periodic use of the Litany in the Book of Common Prayer will be of great benefit. Benefit will also
            come from constant silent utterance throughout the day of the so-called “Jesus Prayer”—“Lord
            Jesus Christ, Son of God, have mercy on me, a sinner.” This is one of many ways of recognizing the
            caring presence of the Father and the Son, who are with us at all times through the agency of the
            Holy Spirit. The exhortation to be constant in prayer is given by St Paul in several places in his 
          """,
          text: "epistles (see, for instance, ",
          ref: "Ephesians 6:18",
          text:
            "), and he instructs us to rely on the assistance of the Holy Spirit, who teaches and helps us to pray (",
          ref: "Romans 8:26-27",
          text: """
            ). All these realities of prayer are rooted in what is called the Lord’s Prayer, the prayer that Jesus taught
            his disciples on two different occasions in slightly varying form (
          """,
          ref: "Matthew 6:9-13",
          ref: "Luke 11:2-4",
          text: """
            ). It is
            called “the Lord’s” because, like many Jewish rabbis, the Lord Jesus was giving his followers a prayer
            that would show that they were his disciples. In our survey of the Christian life as a life of prayer,
            the Lord’s Prayer is set at the center, as it has been in catechetical presentations of Christian prayer
            since Christianity began.
          """
        ]
      ],
      page38: [
        paragraphText: "Intentionally Blank"
      ],
      page39: [
        section: "Concerning Prayer",
        question: :question149,
        question: :question150,
        question: :question151,
        question: :question152,
        question: :question153,
        question: :question154,
        question: :question155,
        section: "The Lord’s Prayer",
        question: :question156
      ],
      page40: [
        question: :question157,
        question: :question158,
        question: :question159,
        question: :question160,
        question: :question161,
        section: "The Address",
        question: :question162,
        question: :question163,
        question: :question164,
        question: :question165
      ],
      page41: [
        question: :question166,
        question: :question167,
        question: :question168,
        section: "The First Petition",
        question: :question169,
        question: :question170,
        question: :question171,
        question: :question172,
        question: :question173,
        question: :question174
      ],
      page42: [
        question: :question175,
        section: "The Second Petition",
        question: :question176,
        question: :question177,
        question: :question178,
        question: :question179,
        question: :question180,
        section: "The Third Petition",
        question: :question181,
        question: :question182
      ],
      page43: [
        question: :question183,
        question: :question184,
        question: :question185,
        section: "The Fourth Petition",
        question: :question186,
        question: :question187,
        question: :question188,
        question: :question189,
        question: :question190
      ],
      page44: [
        section: "The Fifth Petition",
        question: :question191,
        question: :question192,
        question: :question193,
        question: :question194,
        question: :question195,
        question: :question196,
        question: :question197,
        question: :question198,
        question: :question199
      ],
      page45: [
        question: :question200,
        section: "The Sixth Petition",
        question: :question201,
        question: :question202,
        question: :question203,
        question: :question204,
        question: :question205,
        question: :question206,
        section: "The Seventh Petition",
        question: :question207,
        question: :question208
      ],
      page46: [
        question: :question209,
        question: :question210,
        question: :question211,
        question: :question212,
        question: :question213,
        question: :question214,
        question: :question215,
        question: :question216
      ],
      page47: [
        question: :question217,
        question: :question218,
        question: :question219,
        section: "The Doxology and Amen",
        question: :question220,
        question: :question221,
        question: :question222,
        question: :question223
      ],
      page48: [
        section: "Prayer, Liturgy, and a Rule of Life",
        question: :question224,
        question: :question225,
        question: :question226,
        question: :question227,
        question: :question228,
        question: :question229,
        question: :question230,
        question: :question231,
        question: :question232
      ],
      page49: [
        question: :question233,
        question: :question234,
        question: :question235,
        question: :question236,
        question: :question237,
        question: :question238,
        question: :question239,
        question: :question240,
        question: :question241,
        question: :question242
      ],
      page50: [
        question: :question243,
        question: :question244,
        question: :question245,
        question: :question246,
        question: :question247,
        question: :question248,
        question: :question249,
        question: :question250,
        question: :question251
      ],
      page51: [
        question: :question252,
        question: :question253,
        question: :question254,
        question: :question255
      ],
      page52: [
        title: "PART IV: BEHAVING CHRISTIANLY",
        title: "THE TEN COMMANDMENTS AND OBEDIENCE TO CHRIST",
        paragraphText: """
          In Jesus Christ, God calls us to respond to him in three basic ways: by grasping God’s revealed truth
          about Jesus with our minds; by prayerful communion with God in and through Jesus; and by doing
          God’s will. God’s will is primarily revealed to us in Jesus’ word and example, which are inextricably
          linked to the Ten Commandments and other moral instructions found in Scripture.
        """,
        paragraph: [
          text: """
            Catechetical instruction deals with the first aspect through teaching and learning the Apostles’
            Creed. It deals with the second through teaching and learning the Lord’s Prayer. It deals with the
            third by centering on the Ten Commandments (
          """,
          ref: "Exodus 20:1-17",
          ref: "Deuteronomy 5:6-21",
          text: """
            ), which are the heart of the Law of God that Jesus embodied in his own life, and 
            are summarized for us in the command to love God and our neighbor.
          """
        ],
        paragraph: [
          text: """
            The standards set by the Law reflect values and obligations that are, to some degree, impressed upon
            the consciences of all people (
          """,
          ref: "Romans 2:15",
          text: """
            ). Yet God gave the Law in a clear and unmistakable way
            to his chosen people, Israel. Delivering them from slavery in Egypt, he established a covenant
            relationship with them at Mt. Sinai through Moses, giving them the Law. In grateful response to his
            grace, Israel would worship and serve God, living as his people in accordance with his Law.
            In a similar way, the moral teaching of Jesus Christ is universal, authoritative and final. It is set in a
            family relationship with God the Father and established by his love and grace in Christ. Through the
            reconciling power of Jesus’ cross, anyone who names him as Savior and Lord is freed from bondage
            to sin and death, adopted as God’s child, and called to a life of holiness. The Christian life of
            holiness, in which obedience to Christ is central, is rooted in the bond that believers have with the
            Son and the Father through the Holy Spirit. Therefore, keeping the divine Law is a fundamental
            form of the new life into which we are brought by faith in Christ.
          """
        ],
        paragraphText: """
          Following the teaching of Jesus, his apostles, like all the Bible writers, always look at the human
          individual as a whole. They see behavior as a “fruit,” not as something external or separate from
          heart and character. They therefore always speak of human behavior in terms that link behavior with 
          motivation and purpose. For Jesus, acts are only right insofar as the attitude of mind and heart that
          they express is right. The pages that follow reflect the same viewpoint.
        """
      ],
      page53: [
        section: "THE TEN COMMANDMENTS",
        question: :question256,
        question: :question257,
        question: :question258,
        question: :question259,
        question: :question260,
        question: :question261,
        question: :question262
      ],
      page54: [
        question: :question263,
        question: :question264,
        question: :question265,
        question: :question266,
        section: "The First Commandment",
        question: :question267,
        question: :question268,
        question: :question269,
        question: :question270
      ],
      page55: [
        question: :question271,
        section: "The Second Commandment",
        question: :question272,
        question: :question273,
        question: :question274,
        question: :question275,
        question: :question276,
        question: :question277,
        question: :question278
      ],
      page56: [
        question: :question279,
        question: :question280,
        section: "The Third Commandment",
        question: :question281,
        question: :question282,
        question: :question283,
        question: :question284,
        question: :question285
      ],
      page57: [
        section: "The Fourth Commandment",
        question: :question286,
        question: :question287,
        question: :question288,
        question: :question289,
        question: :question290,
        question: :question291,
        question: :question292,
        question: :question293,
        question: :question294
      ],
      page58: [
        section: "The Fifth Commandment",
        question: :question295,
        question: :question296,
        question: :question297,
        question: :question298,
        question: :question299,
        question: :question300,
        section: "The Sixth Commandment",
        question: :question301,
        question: :question302
      ],
      page59: [
        question: :question303,
        question: :question304,
        question: :question305,
        question: :question306,
        question: :question307,
        question: :question308,
        section: "The Seventh Commandment",
        question: :question309,
        question: :question310,
        question: :question311
      ],
      page60: [
        question: :question312,
        question: :question313,
        question: :question314,
        question: :question315,
        question: :question316,
        question: :question317,
        section: "The Eighth Commandment",
        question: :question318,
        question: :question319
      ],
      page61: [
        question: :question320,
        question: :question321,
        question: :question322,
        question: :question323,
        question: :question324,
        section: "The Ninth Commandment",
        question: :question325,
        question: :question326
      ],
      page62: [
        question: :question327,
        question: :question328,
        question: :question329,
        question: :question330,
        section: "The Tenth Commandment",
        question: :question331,
        question: :question332,
        question: :question333,
        question: :question334,
        question: :question335
      ],
      page63: [
        section: "Need for Atonement, Healing, and Joy",
        question: :question336,
        question: :question337,
        question: :question338,
        question: :question339,
        question: :question340,
        question: :question341,
        question: :question342
      ],
      page64: [
        question: :question343,
        question: :question344,
        question: :question345
      ],
      page65: [
        title: "APPENDIX I",
        title: "Prayers for Use with the Catechism of the Anglican Church in North America",
        paragraphText: """
          Prayer is an essential component in the catechetical process. It invites catechists, catechumens and
          sponsors to participate in the presence and power of God, who is at work transforming disciples
          into the image of Jesus Christ. It is a significant means by which Christian faith moves beyond our
          heads into our hearts and hands, so that the reign of God will increase in and through us. Catechists
          and sponsors are encouraged to pray with and for catechumens during sessions, and by beginning
          and ending each session with prayers. The following section contains some of the classic prayers of
          the Church categorized by topics to help in the process of formation:
        """,
        paragraphText: "*For repentance and forgiveness*",
        paragraphText: """
          Almighty and everlasting God, you hate nothing you have made and forgive the sins of all who
          repent: Create and make in us new and contrite hearts, that we, worthily lamenting our sins and
          acknowledging our wretchedness, may obtain of you, the God of all mercy, perfect remission and
          forgiveness; through Jesus Christ our Lord, who lives and reigns with you and the Holy Spirit, one
          God, for ever and ever. *Amen*.
        """,
        paragraphText: "*For rebirth and renewal in Christ*",
        paragraphText: """
          Almighty God, you have given your only-begotten Son to take our nature upon him, and to be born
          of a pure virgin: Grant that we, who have been born again and made your children by adoption and
          grace, may daily be renewed by your Holy Spirit; through our Lord Jesus Christ, to whom with you
          and the same Spirit be honor and glory, now and for ever. *Amen*.
        """,
        paragraphText: "*For purity*",
        paragraphText: """
          Almighty God to whom all hearts are open, all desires known and from whom no secrets are hid,
          cleanse the thoughts of our hearts by the inspiration of your Holy Spirit that we may perfectly love
          you and worthily magnify your holy name through Christ Our Lord. *Amen*.
        """,
        paragraphText: "*For transformation*",
        paragraphText: """
          O God, who wonderfully created, and yet more wonderfully restored, the dignity of human
          nature: Grant that we may share the divine life of him who humbled himself to share our 
          humanity, your Son Jesus Christ; who lives and reigns with you, in the unity of the Holy
          Spirit, one God, for ever and ever. *Amen*.
        """,
        paragraphText: "*For growth in the knowledge and love of God the Father*",
        paragraphText: """
          Almighty God who so loved the world that you gave your only Son, that whoever believes in him
          should not perish but have eternal life; pour into our hearts that most excellent gift of love by the
          Holy Spirit who has been given to us, that we may delight in the inheritance that is ours as your sons
          and daughters, and live to your praise and glory, through Jesus Christ. *Amen*.
        """,
        paragraphText: "*For growth in the Holy Spirit*",
        paragraphText: """
          Heavenly Father, send your Holy Spirit into our hearts, to direct and rule us according to your will,
          to comfort us in all our afflictions, to defend us from all error, and to lead us into all truth; through
          Jesus Christ our Lord. *Amen*.
        """,
        paragraphText: "*Or*",
        paragraphText: """
        O God, who taught the hearts of your faithful people by sending to them the light of your Holy
        Spirit: Grant us by the same Spirit to have a right judgment in all things, and evermore to rejoice in
        his holy comfort; through Jesus Christ your Son, our Lord, who lives and reigns with you, in the
        unity of the Holy Spirit, one God, for ever and ever. *Amen*.
        """
      ],
      page66: [
        paragraphText: "*For self-dedication and commitment to God’s will*",
        paragraphText: """
        Almighty and eternal God, so draw our hearts to you, so guide our minds, so fill our imaginations,
        so control our wills, that we may be completely yours, utterly dedicated to you; and then use us, we
        pray, as you will, and always to your glory and the welfare of your people; through our Lord and
        Savior Jesus Christ. *Amen*.
        """,
        paragraphText: "*For studying the Scriptures*",
        paragraphText: """
        Blessed Lord, who caused all Holy Scriptures to be written for our learning: Grant us so to hear
        them, read, mark, learn, and inwardly digest them, that we may embrace and ever hold fast the
        blessed hope of everlasting life, which you have given us in our Savior Jesus Christ; who lives and
        reigns with you and the Holy Spirit, one God, for ever and ever. *Amen*.
        """
      ],
      page67: [
        paragraphText: "*For quiet hearts*",
        paragraphText: """
          O God of peace, who has taught us that in returning and rest we shall be saved, and in quietness and
          confidence shall be our strength: By your Holy Spirit lift us, we pray, to your presence, where we
          may be still and know that you are God; through Jesus Christ our Lord. *Amen*.
        """,
        paragraphText: "*For preparation for Baptism*",
        paragraphText: """
          Almighty God, by our baptism into the death and resurrection of your Son Jesus Christ, you turn us
          from the old life of sin: Grant that we, being reborn to new life in him, may live in righteousness and
          holiness all our days; through Jesus Christ our Lord, who lives and reigns with you and the Holy
          Spirit, one God, now and for ever. *Amen*.
        """,
        paragraphText: "*For preparation for Confirmation*",
        paragraphText: """
          Grant, Almighty God, that we, who have been redeemed from the old life of sin by our baptism into
          the death and resurrection of your Son Jesus Christ, may be filled with your Holy Spirit, and live in
          righteousness and true holiness; through Jesus Christ our Lord, who lives and reigns with you and
          the Holy Spirit, one God, now and for ever. *Amen*.
        """,
        paragraphText: "*For the ministry of sharing the Gospel with others*",
        paragraphText: """
          Lord Jesus Christ, you stretched out your arms of love on the hard wood of the cross that everyone
          might come within the reach of your saving embrace: So clothe us in your Spirit that we, reaching
          forth our hands in love, may draw those who do not know you to the knowledge and love of you;
          for the honor of your Name. *Amen*.
        """
      ],
      page68: [
        title: "APPENDIX II",
        h1: """
        A Rite for Admission of Catechumens Proposed",
        to the College of Bishops of The Anglican
        Church in North America
        """,
        h2: "*January 7, 2014*",
        indentRubric: """
          This form is to be used for adult persons, or older children who are able to answer for themselves, at the beginning of a course
          of instruction in all the teachings of the Church, in preparation for Holy Baptism, or if baptized as infants, for
          Confirmation.
        """,
        indentRubric: """
          On the day appointed, the persons to be received as Catechumens shall be brought by their sponsors to the Church, and shall
          remain by the principal door, until the Gospel has been proclaimed.
        """,
        rubric: "The Celebrant shall them greet the Catechumens at the door and ask,",
        versical: [speaker: "Celebrant", says: "What is your hope?"],
        versical: [speaker: "Catechumen", says: "That I may have eternal life in Christ."],
        versical: [
          speaker: "Celebrant",
          says: "What do you desire of God and of this congregation?"
        ],
        versical: [speaker: "Catechumen", says: "That I may grow in faith, hope, and love."],
        rubric: "Then the Celebrant shall say,",
        paragraphText: """
          If you hope to enter into eternal life, you must by his grace follow in Our Lord’s steps, for
          He said: “If anyone would come after me, let him deny himself and take up his cross and
          follow me. For whoever would save his life will lose it, but whoever loses his life for my
          sake and the gospel’s will save it.”
        """,
        rubric: "Then the Celebrant shall ask,",
        versical: [
          speaker: "Celebrant",
          says: "Will you turn to Jesus Christ and accept him as your Lord and Savior?"
        ],
        versical: [speaker: "Catechumen", says: "I will."],
        versical: [
          speaker: "Celebrant",
          says: """
            Because none can follow Christ without God’s grace and apart from Christ’s
            Body, will you join with us in our common life of worship, teaching, service,
            and fellowship?
          """
        ]
      ],
      page69: [
        versical: [speaker: "Catechumen", says: "I will."],
        rubric:
          "The Celebrant shall lead the Catechumens to the chancel steps, where they shall kneel, and the Celebrant shall pray over them, saying,",
        versical: [speaker: "Celebrant", saying: "Let us pray."],
        paragraphText: """
          O Lord God of Hosts, before the terror of whose presence the armies of Hell are put to
          flight: Deliver these your servants from the powers of the world, the flesh, and the Devil; cast
          out from them every evil and unclean spirit that lurks in the heart, and any spirit of error or
          wickedness; and make them ready to receive the fullness of your Holy Spirit; through Jesus
          Christ our Lord. *Amen*.
        """,
        rubric: """
          Then the Celebrant shall take the OIL OF THE CATECHUMENS, and sign each Catechumen with a cross on their
          forehead, saying to each,
        """,
        paragraphText: """
          May almighty God deliver you from the powers of darkness and evil and lead you into the
          light and obedience of the kingdom of his Son, Jesus Christ our Lord. *Amen*.
        """,
        rubric: "Then, the Catechumens kneeling, the Priest shall bless them, saying:",
        paragraphText: """
          May Almighty God, who in His love for you has called you to the knowledge of His grace,
          grant you entrance into His kingdom; through Jesus Christ our Lord.
          *Amen*.
        """
      ],
      page70: [
        title: "APPENDIX III",
        title: "THE CREEDS",
        section: "Nicene Creed",
        line: "We believe in one God,",
        indentLine: "the Father, the Almighty,",
        indentLine: "maker of heaven and earth,",
        indentLine: "of all that is, visible and invisible.",
        line: "We believe in one Lord, Jesus Christ,",
        indentLine: "the only Son of God,",
        indentLine: "eternally begotten of the Father,",
        indentLine: "God from God, Light from Light,",
        indentLine: "true God from true God,",
        indentLine: "begotten, not made,",
        indentLine: "of one Being with the Father;",
        indentLine: "through him all things were made.",
        indentLine: "For us and for our salvation he came down from heaven,",
        indentLine: "was incarnate from the Holy Spirit and the Virgin Mary,",
        indentLine: "and was made man.",
        indentLine: "For our sake he was crucified under Pontius Pilate;",
        indentLine: "he suffered death and was buried.",
        indentLine: "On the third day he rose again in accordance with the Scriptures;",
        indentLine: "he ascended into heaven",
        indentLine: "and is seated at the right hand of the Father.",
        indentLine: "He will come again in glory to judge the living and the dead,",
        indentLine: "and his kingdom will have no end.",
        line: "We believe in the Holy Spirit, the Lord, the giver of life",
        line: "who proceeds from the Father [and the Son]",
        footnote: [
          number: 1,
          text: """
            The filioque [and the Son] is not in the original Greek text. Nevertheless, in the Western Church the filioque [and the
            Son] is customary at worship and is used for the explication of doctrine [39 Articles of Religion]. The operative resolution
            of the College of Bishops concerning use of the filioque is printed with the General Instructions at the end of the Holy
            Communion, Long Form.
          """
        ],
        line: "who with the Father and the Son is worshiped and glorified,",
        line: "who has spoken through the prophets.",
        line: "We believe in one holy catholic and apostolic Church.",
        line: "We acknowledge one baptism for the forgiveness of sins.",
        line: "We look for the resurrection of the dead,",
        line: "and the life of the world to come. Amen."
      ],
      page71: [
        section: "The Apostles’ Creed",
        line: "I believe in God, the Father almighty,",
        indentLine: "creator of heaven and earth.",
        line: "I believe in Jesus Christ, his only Son, our Lord.",
        indentLine: "He was conceived by the Holy Spirit",
        indentLine: "and born of the Virgin Mary.",
        indentLine: "He suffered under Pontius Pilate,",
        indentLine: "was crucified, died, and was buried.",
        indentLine: "He descended to the dead.",
        indentLine: "On the third day he rose again.",
        indentLine: "He ascended into heaven,",
        indentLine: "and is seated at the right hand of the Father.",
        indentLine: "He will come again to judge the living and the dead.",
        line: "I believe in the Holy Spirit,",
        indentLine: "the holy catholic Church,",
        indentLine: "the communion of saints,",
        indentLine: "the forgiveness of sins,",
        indentLine: "the resurrection of the body,",
        indentLine: "and the life everlasting. Amen.",
        section: "The Creed of Saint Athanasius (Quicunque Vult)",
        line:
          "Whosoever will be saved, before all things it is necessary that he hold the Catholic Faith.",
        line: """
          Which Faith except everyone do keep whole and undefiled, without doubt he shall perish
          everlastingly.
        """,
        line: """
        And the Catholic Faith is this: That we worship one God in Trinity, and Trinity in Unity,
        neither confounding the Persons, nor dividing the Substance.
        """,
        line:
          "For there is one Person of the Father, another of the Son, and another of the Holy Ghost.",
        line: """
          But the Godhead of the Father, of the Son, and of the Holy Ghost, is all one, the Glory
          equal, the Majesty co-eternal.
        """,
        line: "Such as the Father is, such is the Son, and such is the Holy Ghost.",
        line: "The Father uncreate, the Son uncreate, and the Holy Ghost uncreate.",
        line: """
          The Father incomprehensible, the Son incomprehensible, and the Holy Ghost
          incomprehensible.
        """,
        line: "The Father eternal, the Son eternal, and the Holy Ghost eternal.",
        line: "And yet they are not three eternals, but one eternal.",
        line: """
          As also there are not three incomprehensibles, nor three uncreated, but one uncreated, and
          one incomprehensible.
        """,
        line:
          "So likewise the Father is Almighty, the Son Almighty, and the Holy Ghost Almighty.",
        line: "And yet they are not three Almighties, but one Almighty.",
        line: "So the Father is God, the Son is God, and the Holy Ghost is God.",
        line: "And yet they are not three Gods, but one God.",
        line: "So likewise the Father is Lord, the Son Lord, and the Holy Ghost Lord.",
        line: "And yet not three Lords, but one Lord.",
        line: """
          For like as we are compelled by the Christian verity to acknowledge every Person by
          himself to be both God and Lord,
        """,
        line:
          "So are we forbidden by the Catholic Religion, to say, There be three Gods, or three Lords.",
        line: "The Father is made of none, neither created, nor begotten.",
        line: "The Son is of the Father alone, not made, nor created, but begotten.",
        line: """
          The Holy Ghost is of the Father and of the Son, neither made, nor created, nor begotten,
          but proceeding.
        """,
        line: """
          So there is one Father, not three Fathers; one Son, not three Sons; one Holy Ghost, not three
          Holy Ghosts.
        """,
        line:
          "And in this Trinity none is afore, or after other; none is greater, or less than another;",
        line: "But the whole three Persons are co-eternal together and co-equal.",
        line: """
          So that in all things, as is aforesaid, the Unity in Trinity and the Trinity in Unity is to be
          worshipped.
        """,
        line: "He therefore that will be saved is must think thus of the Trinity.",
        line: """
          Furthermore, it is necessary to everlasting salvation that he also believe rightly the
          Incarnation of our Lord Jesus Christ.
        """,
        line: """
          For the right Faith is, that we believe and confess, that our Lord Jesus Christ, the Son of
          God, is God and Man;
        """,
        line: """
          God, of the substance of the Father, begotten before the worlds; and Man of the substance
          of his Mother, born in the world;
        """,
        line: "Perfect God and perfect Man, of a reasonable soul and human flesh subsisting.",
        line: """
          Equal to the Father, as touching his Godhead; and inferior to the Father, as touching his
          manhood;
        """,
        line: "Who, although he be God and Man, yet he is not two, but one Christ;",
        line:
          "One, not by conversion of the Godhead into flesh but by taking of the Manhood into God;",
        line: "One altogether; not by confusion of Substance, but by unity of Person.",
        line: "For as the reasonable soul and flesh is one man, so God and Man is one Christ;",
        line:
          "Who suffered for our salvation, descended into hell, rose again the third day from the dead.",
        line: """
          He ascended into heaven, he sitteth at the right hand of the Father, God Almighty, from
          whence he will come to judge the quick and the dead.
        """,
        line: """
          At whose coming all men will rise again with their bodies and shall give account for their
          own works.
        """,
        line: """
          And they that have done good shall go into life everlasting; and they that have done evil into
          everlasting fire.
        """,
        line:
          "This is the Catholic Faith, which except a man believe faithfully, he cannot be saved."
      ],
      page72: [
        paragraphText: "Intentionally Blank"
      ],
      page73: [
        h2: "Toward an Anglican Catechumenate",
        rightJustify: [
          line: "*Guiding Principles for the Catechesis Task Force*",
          line: "*Anglican Church in North America*",
          footnote: [
            number: 2,
            text: """
              This report was prepared with extensive collaboration from members of the Catechesis Task Force. The lead writer
              was Phil Harrold, Ph.D., Associate Professor of Church History, Trinity School for Ministry, Ambridge, PA, For
              questions concerning the contents and overall status of this working document please contact Prof. Harrold at
              <pharrold@tsm.edu>.
            """
          ]
        ],
        section: "Abstract",
        paragraphText: """
          This document presents a working definition of a catechumenate for the Anglican Church in
          North America along with guiding principles for implementing this disciple-making initiative.
          The Task Force proposes a mission-minded dual catechetical approach: (1) catechetical
          evangelism, which focuses on disciple-making in an evangelistic situation (from the ‘front
          porch’ of the church); and (2) liturgical catechesis, which focuses on disciple-making within the
          formational contexts of family and church (‘from the font’). The guiding principles, which are
          drawn from Anglican formularies and historic patterns from the undivided Church, reflect this
          comprehensive framework for implementation. They will be useful in the selection or
          development of a common catechism as well as the collection and/or production of Christian
          education materials (especially curricula) that serve the mission of the Church.
        """,
        section: "Introduction",
        paragraphText: """
          The Catechesis Task Force was formed (originally as the Committee on Catechesis &
          Curriculum) to advise the House of Bishops of the Anglican Church in North America (ACNA)
          concerning the training and instruction of the faithful and, most especially, the making of
          disciples of Jesus Christ. The Task Force is particularly mindful of paragraph two in Article III
          (“The Mission of the Province”) in the ACNA Constitution:
        """,
        quoteText: """
          The work of the Province is to equip each member of the Province so that they may reconcile the world to
          Christ, plant new congregations, and make disciples of all nations; baptizing them in the Name of the
          Father, and of the Son and of the Holy Spirit, and teaching them to obey everything commanded by Jesus
          Christ.
        """,
        paragraph: [
          text: """
            The Task Force understands the critical role of catechesis in the ministry of the Church and aims
            to strengthen the ACNA’s commitment to calling, forming, equipping, and sending followers of
            Jesus Christ—“truly serving thee in holiness and righteousness all the days of their life.”
          """,
          footnote: [
            number: 3,
            text: """
              Unless otherwise noted, references herein to The Book of Common Prayer are drawn from Rite One, found on pp. 322-349: [
              of the 1979 edition (The Church Hymnal Corporation, New York). Please note that this does not signify an
              endorsement of the 1979 edition per se, only a recognition that it is widely available to many readers of this document.
              Cross-references may be found in the 1662 BCP and to subsequent editions in North America, especially the 1928 BCP,
              as recognized by the Reformed Episcopal Church, and the 1962 Canadian BCP.
            """
          ],
          text: """
            The Great Commission necessarily includes instruction, as directed in section two of Canon four (“Of
            the Administration of the Dominical Sacraments”):
          """
        ]
      ],
      page74: [
        quote: [
          text: """
            All Clergy shall take care that all within their cures are instructed in the doctrine, sacraments, and discipline
            of Christ, as the Lord has commanded and as they are set forth in the Holy Scriptures, in the Book of
            Common Prayer, and in the Church Catechism.
          """,
          footnote: [
            number: 4,
            text: """
              The ratified Constitution and Canons of the ACNA are available online at: <http://anglicanchurch.net/>
            """
          ]
        ],
        paragraphText: """
          Reflecting the ACNA’s ties to the wider Anglican Communion, the Catechesis Task Force also
          works in support of the Anglican Catechism in Outline (ACIO), as proposed in the Interim
          Report of the Global South Anglican Theological Formation and Education Task Force
          (presented to the Global South Primates Steering Committee on 6 January 2008). As noted in
          the Report’s Preface, paragraph four:
        """,
        quote: [
          text: """
            The Task Force saw a need to provide a common theological framework to underpin the varieties of
            catechisms throughout the Anglican Communion. In January 2007, the Task Force recommended to the
            Global South Primates the drafting of such theological framework that would “incorporate common
            elements for each catechism reflecting Biblical faith, historic Anglican heritage and the mission situations
            in which the faithful live today.”
          """,
          footnote: [
            number: 5,
            text: """
              Anglican Catechism in Outline (ACIO), Interim Report of the Global South Anglican Theological Formation and: 
              Education Task Force (6 January 2008), Preface, Paragraph 4. The ACIO is available online at:
              <http://www.globalsouthanglican.org/sse/aciointerimreport_1.pdf>.
            """
          ]
        ],
        paragraph: """
          With these commitments in view, the Catechesis Task Force has been charged (originally as the
          Committee on Catechesis & Curriculum) to serve the Province in the following ways:
        """,
        quoteText: """
          (1) encourage lifelong spiritual growth and learning, with particular emphasis on the hallmarks of genuine
          discipleship, and especially a transformative apprenticeship (or follower-ship) to Jesus Christ;
        """,
        quoteText: """
          (2) develop a comprehensive catechumenal vision and framework, which will include a common
          catechism: this will be submitted for approval and implementation throughout ACNA;
        """,
        quoteText: """
          (3) facilitate the collection and/or production of Christian education materials, curricula, etc. that serve this
          catechumenal end.
        """,
        paragraph: [
          text: """
            In addition, the Task Force acknowledges the current challenges of restoring catechesis to its critical place
            in the mission of the Church. In a recent survey conducted by the Task Force over a hundred respondents
            scattered throughout the ACNA confirmed the widely held belief that Anglicans are failing to effectively
            catechize young people, especially. A majority of the respondents were dissatisfied with the catechesis of
            adolescents and children with 57% of respondents expressing dissatisfaction with the training of
            adolescents and 52% disappointed with the catechesis of children. Results for higher age levels fared
            better, but still reflect significant doubt or, at least, uncertainty regarding the effectiveness of training and
            equipping disciples.
          """,
          footnote: [
            number: 6,
            text: """
              The Survey results will be published in a forthcoming report. A press release of the Survey was made available at:
              <http://acnaassembly.org/index2.php/acna/page/99>.
            """
          ]
        ],
        paragraphText: """
          In response to these challenges and to the charge given us, the Task Force will work on the basis
          of the guiding principles listed at the conclusion of this report. Here follows a rationale for these
          principles and the essentials of an Anglican catechumenate, as well as criteria for discerning
          what is permissible *and* prudent, given the mission, context, and diversity of ACNA constituents.
        """
      ],
      page75: [
        section: [
          text: "Terms & Definitions",
          footnote: [
            number: 7,
            text: """
              See also the glossary of key terms at the conclusion of this report. A helpful definition and discussion of catechesis is
              found in J. I. Packer, “Called to Catechize,” *The North American Anglican*, vol. 2 (Spring 2009): 46-55.
            """
          ]
        ],
        paragraphText: """
          **Catechumenal Terminology**: We use the term catechumenate because it is the overall
          operational framework in which *catechesis* (instruction) and *catechism* (the instrument[s] of
          instruction) function. A catechumenate necessarily accounts for activities and processes that
          form and equip Christians, pre- or post-baptism. A catechumenate does not merely deliver
          information regarding the Christian faith; it also transmits the skills, including how to read and
          respond to Scripture, which prepare individuals for full participation in the life and mission of
          the Church, building-up the whole people of God in Christlikeness and discipleship. In short, a
          catechumenate makes communities of life-long disciples of Jesus Christ.
        """,
        paragraph: [
          text: """
            **As a working definition, the ACNA Catechumenate** seeks, welcomes, instructs, trains, forms,
            and deploys Christians who pursue, in the power of the Holy Spirit, the call of Jesus to live
            according to his gospel as citizens in his kingdom and members of his body, the Church.
            Accordingly, the Catechumenate is realized in four dimensions: (i) the call to new identity
            (
          """,
          ref: "Galatians 4:6-7",
          text: ") and new community (",
          ref: "I Peter 2:9-10",
          text: ") to live to the praise of God’s glory (",
          ref: "Ephesians 1:3-14",
          text: "); (ii) the call to faithful witness (",
          ref: "Jude 3",
          text: ") and endurance (",
          ref: "Matthew 10:22",
          text: "); (iii) the call to holiness (",
          ref: "I Peter 1:13-16",
          text: ") and stewardship (",
          ref: "Matthew 25:14",
          text: "); and (iv) the call to ministry (",
          refs: ["Romans 12:4-8", "Galatians 6:10"],
          text: ") and mission (",
          refs: ["Acts 1:8", "Matthew 5:13-16"],
          text: ").",
          footnote: [
            number: 8,
            text: """
              Slightly modified from the definition provided in the Anglican Catechism in Outline (ACIO), Interim Report of the: [
              Global South Anglican Theological Formation and Education Task Force (6 January 2008), Preface, Paragraph 9.
            """
          ]
        ],
        section: "Thinking Missionally about a Catechumenate",
        paragraphText: """
          The historic catechumenate promotes a missionary zeal that prepares the faithful to be present as
          Christians *in the world*, empowering the faithful to fulfill their vocation as disciples and to
          understand their role in bringing Christ to all people and all places. The catechumenate reflects
          the evangelical mind of Christ, which seeks to form believers who are compassionate, merciful
          and just.
        """,
        paragraphText: """
          Given the missionary situation of the Anglican Church in North America, the Task Force will
          acknowledge two intersecting pathways in the catechumenate: *catechetical evangelism*, from the
          ‘front porch’ of the local church, and *liturgical catechesis*, from the ‘font.’ The first approach
          highlights the transformative process of becoming a Christian (conversion) in an evangelistic
          and, at least initially, un-churched situation. This pathway leads individuals through a series of
          preparatory stages and rites of passage that culminate in baptism and initiation into the full
          sacramental life and Gospel-defined mission of the Church. It might be called “Protocatechesis”
        """
      ],
      page76: [
        paragraph: [
          text: """
          in its focus on the “seeker.” The second approach is defined by conversion from ‘cradle-tograve,’
          with particular emphasis on the spiritual nurture of baptized children by godly parents in
          catechumenal parish settings. At their confirmation, such individuals “make a mature public
          affirmation of their faith and commitment to the responsibilities of their baptism.”
          """,
          footnote: [
            number: 9,
            text: """
              BCP, 412; J. I. Packer would identify the second approach in terms of “catechesis proper as well as ongoing catechesis.
              See, especially, J. I. Packer and Gary A. Parrett, *Grounded in the Gospel: Building Believers the Old-Fashioned Way* (Grand
              Rapids: Baker Books, 2010).
            """
          ]
        ],
        image: "IMAGE GOES HERE",
        # CATECHETICAL  
        # EVANGELISM  
        # from  the ‘front  
        # porch’
        # LITURGICAL  
        # CATECHESIS
        # from  the ‘font’
        # baptism
        paragraphText: """
          Obviously, these pathways are not mutually exclusive in the everyday life of those communities
          of faith which reach out to the lost and nurture those who, by God’s grace, are born into churchattending
          Christian families. Both aim to form, equip, and deploy disciples of Jesus Christ who
          fully participate in the life and mission of the Church. Nevertheless, each approaches the
          catechumenate from a different starting point that reflects the situation and life-course of
          individual catechumens. Let us take a closer look at each of these catechumenal pathways.
        """,
        paragraph: [
          text: """
            *Catechetical Evangelism*: In the early years of the Church, when “Christians were made and
            not born” (quoting Tertullian), an individual seeking membership in a local household of faith
            had to go through a long period of catechesis prior to baptism.
          """,
          footnote: [
            number: 10,
            text: """
              Tertullian, quoted in Alexander Schmemann, *Liturgy and Life: Christian Development through Liturgical Experience*
              (Department of Religious Education: Orthodox Church in America, 1983), 7.
            """
          ],
          text: """
            The process was marked by
            four stages: (1) *evangelization* (inquiry and introductory summary of the faith), (2) *catechesis*
            (long-term instruction and mentoring), (3) *enlightenment* (final pre-baptismal instruction), and
            (4) *mystagogy* (post-baptismal instruction concerning the rituals and deeper mysteries of the
            faith, especially the Eucharist).
          """,
          footnote: [
            number: 11,
            text: """
              A standard history of early catechesis is available in Michael Dujarier, *A History of the Catechumenate: The First Six:
              Centuries* (New York: Sadlier, 1979). See also Robert Louis Wilken, “Christian Formation in the Early Church,” in
              *Educating People of Faith: Exploring the History of Jewish and Christian Communities*, ed. John Van Engen (Grand Rapids:
              Eerdmans, 2004); Paul J. Griffiths, *Religious Reading: Their Place of Reading in the Practice of Religion* (Oxford Unviersity Press,
              1999); and Alan Kreider, *The Change of Conversion and the Origin of Christendom* (Eugene, OR: Wipf & Stock, 1999). It is
              important to note that the traditional four stages are marked by three rites(1) preliminary acceptance into the order of
              the catechumens; (2) election or enrollment of names of those who are approved for baptism; and (3) the sacrament of
              initiation—baptism.
            """
          ],
          text: """
            This four-stage approach reflected the ministry context of the
            emerging Christian community. The Church existed as an outpost of resident-aliens in a pagan
            and pluralistic world—a world in economic disarray, social and political instability, and cultural
            decline. Conversion involved a radical transformation from one way of life to another, from the
            stories of bondage to idols and power structures to The Story of God’s rescue mission in the
            person and work of Jesus Christ.
          """,
          footnote: [
            number: 12,
            text: """
              Recall the words of Origen (c. 185 - c.254): “Captives we have been, who for many years Satan held in bonds.”: [
              *Homilies on Luke* 32.4. 
            """
          ]
        ]
      ],
      page77: [
        paragraph: [
          text: """
            The Anglican Church in North America finds itself in a similar situation today—in what many
            refer to as a ‘post-Christendom’ world that is becoming less Christian each day. In its robust
            church-planting initiatives, the ACNA will recover a pre-Christendom approach to catechesis
            that is designed to introduce un-churched and non-Christian individuals to the Gospel and the
            pilgrim people of God. The journey is defined not just by instruction, but also by formation in
            the inner life, lifestyle, and worldview of biblical faith. It is a holistic vision that becomes reality
            as individuals who previously followed the ways of the world begin to follow the way of Jesus.
            After all, as Aidan Kavanagh reminds us, “Catechumens do not fall from heaven in Glad Bags.”
            They must first be evangelized—that is reached through witness and word—with the Good News
            of Jesus Christ. When this happens, the Church will necessarily see conversion as a process, as a
            journey of formation in stages.
          """,
          footnote: [
            number: 13,
            text: """
              [^13]: Aidan Kavanagh, O.S.B., “Catechesis: Formation in Stages,” in *The Baptismal Mystery and the Catechumenate*, ed. Michael
              W. Merriman (New York: The Church Hymnal Corporation, 1990): 37.
            """
          ]
        ],
        paragraphText: """
          Practically, this means that the journey will feature pre-baptismal instruction set within a
          consciously evangelistic framework. Conversion will be realized in a turning, or series of
          turnings, to Jesus Christ as Lord and Savior. The ‘evangelization’ stage will initiate this turning
          in response to the hearing of the Gospel. As commitment strengthens, so will understanding of
          salvation and transformation of outlook and conduct. Believing, belonging, and behaving are
          intertwined even in a more formal catechetical stage, perhaps lasting from one- to three-years.
          Ultimately, a period of more intense preparation (illumination), typically offered during the
          season of Lent or, perhaps, during Holy Week, sets the stage for baptism, inaugurating the
          catechumen into the Body of Christ. More instruction and formation follow in the mystagogy
          and full participation in the sacramental life and mission of the Church.
        """,
        paragraph: [
          text: """
            In a very crucial sense, this entire journey is evangelical in flavor—that is, it involves a deeply
            transformative response to the Gospel of salvation in Jesus Christ. That is why we refer to this
            four-stage pathway as ‘catechetical evangelism.’ Already, the vision is being articulated by our
            Archbishop, Robert Duncan, and by our leading pastors and church planters.
          """,
          footnote: [
            number: 14,
            text: """
              For Archbishop Duncan’s stress on “missionary focus,” see his “Inaugural Address” and “Introduction to the: 
              Constitution and Canons” at the ACNA website: <http://www.theacna.org/>.
            """
          ],
          text: """
            Rector of Truro
            Church (Fairfax, VA), Tory K. Baucum, describes catechetical evangelism as “the front-porch of
            the Church”—a distinctive “social space” and “faith culture” with “patterned practices that
            encourage and enable evangelical hospitality, so that those who are far from Christ may come
            close to him and discover in the hospitality of the Church the warm, reconciling welcome of her
            triune God.”
          """,
          footnote: [
            number: 15,
            text: """
              Tory K. Baucum, *Evangelical Hospitality: Catechetical Evangelism in the Early Church and Its Recovery for Today* (Landham,
              Maryland: The Scarecrow Press, 2008), xv.
            """
          ],
          text: """
            The front-porch extends into the mission field of the Church, ever widening the
            arena of welcome and witness.
          """
        ],
        paragraph: [
          text: """
            Drawing on the wisdom of ancient Christian catechesis, the small group dynamics of John
            Wesley’s Methodist societies, and the more recent ALPHA course, Baucum’s front-porch is
            accommodating and relational. It is adaptive to all kinds of social-cultural contexts and upholds
            friendship and social networks as necessary media for developing interpersonal trust. The
            hospitality will necessarily include formative relationships between seekers and their
            sponsors/mentors and teachers outside as well as within the Church, rituals that engage the whole
            person in “threshold events,” and a “language of transformation” that expresses the content of
            faith and new way of life in a richly diverse context—“a normative context for the Holy Spirit’s
            saving work among the people of God.”
          """,
          footnote: [
            number: 16,
            text: """
              Ibid., 19, 35. We might also recall here the insights of Anglican evangelist and scholar Michael Green, *Church without
              Walls: A Global Examination of Cell Church* (London: Paternoster Press, 2002).
            """
          ]
        ]
      ],
      page78: [
        paragraph: [
          text: """
            Catechetical evangelism is also envisioned by church-planting bishop (Anglican Mission in
            America) Todd D. Hunter in his book, Christianity Beyond Belief: Following Jesus for the Sake
            of Others (2009). With Baucum, Hunter reminds us that the Christian faith is a journey:
            “following Jesus’ model of life in the kingdom through the power of the Holy Spirit in the actual
            events of our lives.”
          """,
          footnote: [
            number: 17,
            text: """
              Todd D. Hunter, *Christianity Beyond Belief: Following Jesus for the Sake of Others* (Downers Grove: IVP Books, 2009), 24.
            """
          ],
          text: """
            This “brand-new life,” realized in terms of believing, belonging, and
            behaving, begins with the sort of front-porch hospitality described by Baucum. It will take a
            variety of forms, depending on individuals, their apostolic gifts, and their mission contexts, even
            as it strives for the enduring goals associated with the historic four-stage catechumenate. Hunter
            observes:
          """
        ],
        quote: [
          text: """
            We are accustomed to seekers following this model: first they believe Christian truth, then they join our
            churches, and then they take on our practices and behaviors. I suspect, though, that upon reflection we may
            see that people have come to faith in more varied ways. Today, many people are starting at the ‘end’ and
            practicing their way into the faith. It seems to be working just fine. Others start in the middle by joining a
            Christian community before they believe. In fact, they often join in an effort to find out what Christians
            believe.
          """,
          footnote: [
            number: 18,
            text: """
              Ibid., 96-97."
            """
          ]
        ],
        paragraph: [
          text: """
            Echoing the relational dynamics of the ancient catechumenate, Hunter sets forth the goal of
            “cooperative friendship” with God and neighbor at the micro-level of interpersonal relationships
            (especially in his small-group ministry known as Three-Is-Enough), and the macro-level of
            Church life and mission. Through the love and care that God’s people show, unchurched and
            non-Christian individuals discover a life that is qualitatively different from what they knew
            before. Biblical instruction, spiritual practices and skill development (especially reading and
            responding to Scripture), and increasing participation in the life and mission of the Church train
            them to be more aware of the needs of others and more attentive to “the still small voice” of God.
            Jesus Christ becomes their pattern and conformity to the mind of Christ their heart’s desire (
          """,
          ref: "Phil. 2:5",
          text: """
            ). The Holy Spirit, in turn, provides the power and gifts that are required to live as fully
            active members of Christ’s Body (
          """,
          ref: "I Cor. 12",
          text: ")."
        ],
        paragraph: """
          The evangelical hospitality and socialization described by Baucum and Hunter provide entry to
          the deeper formation uniquely found in the Church. This will usually involve a transition from
          the relatively unstructured, even casual, atmosphere of welcome to a more structured and formal
          process that requires long-term commitment. Local communities work out these details in a way
          that preserves both hospitality and integrity. The “front-porch” is, in effect, an extension of the
          disciple-making catechumenate into the mission-field of the Church. That is why stage-one
        """
      ],
      page79: [
        paragraph: [
          text: """
            (evangelization) may occur primarily outside church walls, in homes, workplaces, coffee shops,
            etc. Stage-two (catechesis) may also be accomplished, in part, ‘where people are at,’ as long as
            it steadily points to the goal of full participation in the sacramental life and Gospel-defined
            mission of the Church. Here is where the journey inward (spiritual transformation) leads to the
            journey outward (loving service to God and neighbor). In the words of Simon Chan it is “the
            community in which the gospel finds its concrete expression in worship, life and mission.”
          """,
          footnote: [
            number: 19,
            text: """
              Simon Chan, Liturgical Theology: The Church as Worshiping Community (Downers Grove: IVP Academic, 2006), 107.
            """
          ]
        ],
        paragraphText: """
          Indeed, a comprehensive catechumenate leads converts into the “Christian sacramental
          universe,” where they encounter the mystery of the triune God’s grace and glory in the liturgy.
          This pathway is indicated by the liturgical progression in the *Book of Common Prayer* from
          “hearing and receiving thy Holy Word” to becoming, sacramentally, “very members incorporate
          in the mystical body” of Christ. This participation also incorporates individuals into the mission
          of the Church where, in Cranmer’s words, we “do all such good works as thou hast prepared for
          us to walk in.” So, in effect, becoming what we eat determines our identity and our mission,
          individually and corporately. This brings us to the pathway known as liturgical catechesis.
        """,
        paragraphText: """
          Liturgical Catechesis: Those who are born, baptized, and raised to maturity in Christian homes
          and church settings start from a different place, but head toward the same destination as those
          who come to faith through the catechetical evangelism of the Church. The catechetical process
          may differ in its starting place and order—with baptism preceding confirmation—but the aim is
          the same: “to form, equip, and deploy disciples of Jesus Christ who fully participate in the life
          and mission of the Church.” Children, youth, and, perhaps, young-adults are the catechumens
          who, like their counterparts from unchurched or non-Christian backgrounds, undergo preparation
          through study, skill-development, and formation, but for the particular purpose of “ratifying and
          confirming” the solemn promises and vows previously made on their behalf in infant baptism. In
          the Order of Confirmation of the 1662 *Book of Common Prayer*, the bishop prays for their
          strengthening in the Holy Spirit, the daily increase of “the manifold gifts of grace; the spirit of
          wisdom and understanding,” and “true godliness,” all this implying a deliberate course of
          training in discipleship. Because this pathway is completely circumscribed by the liturgical life
          of the Church, it is often referred to as ‘liturgical catechesis.’
        """,
        paragraph: [
          text: """
            Here there is as much attention devoted to the way stages of faith and rites of passage signify
            new thresholds and, indeed, progress in the journey. This reminds us that the reality of
            conversion still depends on the reassembly or reordering of the personality around a new center
            of gravity: the person and work of Jesus Christ. The transformation, as always, is enabled by
            divine grace and mediated through the Christian home and the varied ministries of the Church. It
            is perhaps more subtle given the steady nurture afforded by faithful parents and godparents, as
            well as the Christian community as a whole. But as in catechetical evangelism, the young
            person’s faith is ultimately “deployed and consummated” as he or she participates more fully in
            the Body of Christ.[^20]
          """,
          footnote: [number: 20, text: "Kavanagh, 40."]
        ]
      ],
      page80: [
        paragraphText: """
          The term ‘liturgical catechesis’ is also used to indicate a wide range of necessary connections
          between the liturgy and the catechumenate, reminding us that worship is as essential to the
          making of a Christian as socialization, learning, and training. Anglican theologian John H.
          Westerhoff III provides a helpful description of what this looks like in the context of the
          Eucharistic liturgy:
        """,
        quote: [
          text: """
            We are formed by the liturgy so that we might live a Eucharistic life, a life in gratitude to God. We gather
            in the grateful awareness that God is with us. We listen and thank God for God’s Word. In grateful
            response to God’s Good News we sing a love song of thanksgiving. We pray thankfully, knowing that God
            is already seeking to do good things for us and all people. In gratitude for the gift of community we share
            God’s peace. In thanksgiving we bring to God what God has already given to us. In thanksgiving we share
            God’s gifts and with gratitude we go forth to bring God’s grace to all peoples. Christian stewardship
            implies a Eucharistic life. When the Eucharist is at the center of our lives then both a proper understanding
            of stewardship and a faithful life as stewards of God are made possible, indeed are enhanced.
          """,
          footnote: [
            number: 21,
            text: """
              John H. Westerhoff III, *Building God’s People in a Materialistic Society" (New York: Seabury Press, 1983): 73.
            """
          ]
        ],
        paragraph: [
          text: """
            But liturgical catechesis also accounts for the ways that catechesis serves this liturgy. Here we
            demonstrate the biblical faith that shaped The Book of Common Prayer, both in its language and
            its forms and rituals. We also explore the historic relationship between catechesis and the
            Service of the Word, which in the ancient world was called the Rite of the Catechumens. It is
            crucial that catechumens develop the skills necessary to recognize and receive the evangelical
            and formational power of the liturgy and enjoy the everyday blessings of the prayer book in the
            Daily Office, the Lectionary, and so on. In all of these means of grace, the distinctive liturgical
            life of the Church is nourished and sustained as it finds fertile soil in the lives of its catechumens.
            Liturgical catechesis is especially mindful of these mutual benefits.
          """,
          footnote: [
            number: 22,
            text: """
              Historically, this relationship is most keenly realized in the ‘mystagogical’ stage. It is here that we: (1) interpret the: [
              rites in light of the events of salvation, in accordance with the Church’s living tradition; (2) present the historic
              /traditional meanings of the signs, symbols, and gestures contained in the rites; and (3) bring out the significance of the
              rites in the life of the church as essential for Christian life. Here one gains a deep and abiding understanding of the
              Paschal mystery and how Christ died for the sins of all humanity because of His profound love for each and every single
              person.
            """
          ]
        ],
        paragraph: [
          text: """
            Customarily, the dynamic relationship between liturgy and catechesis has been most fully
            realized where the whole process of initiation is set within the worship life of the Church. This
            makes particular sense when infant baptism is followed by catechesis and confirmation—the
            traditional nurture scenario that brings children to maturity in Christ’s body. This is a sign that
            the community of faith is equipped not only to evangelize and welcome the stranger, but also
            pass on the faith to its own, particularly the children of godly parents. But we must also
            remember that liturgical catechesis extends to the whole of life, from cradle to grave, and to all
            of those who are committed to authentic discipleship in Jesus Christ.
          """,
          footnote: [
            number: 23,
            text: """
              With regard to content, it is important to note that the hallmarks of traditional catechesis—the Apostles’ Creed,: [
              Decalogue, and Lord’s Prayer—are also standard features of historic Christian worship. Together they form a coherent
              theology and pattern of Christian life. All are recited in a corporate setting with an attitude of praise and thanksgiving.
              Here, according to Simon Chan, we realize that “[w]e are a community marked by belief in the triune God [in the
              Creed]; our practice is governed by God’s gracious gift of this law [in the Decalogue]; and this graced life is characterized
              by personal communion with the triune God [in the Lord’s Prayer].” See Chan, 109.
            """
          ],
          text: """
            Ultimately, liturgical
            catechesis demonstrates the mutual necessity of a vital worship-oriented (the vertical dimension)
            *and* mission-oriented life (the horizontal dimension) that sends us “into the world . . . to love and
            serve” God.
          """,
          footnote: [number: 24, text: "BCP, 365."]
        ]
      ],
      page81: [
        paragraph: [
          text: """
            Given the prominence of scriptural authority in historic Anglicanism, the relationship between
            the Bible and liturgy in the Service of the Word is of fundamental importance. We must
            remember that the Church is constituted by Word and Spirit to be the place where we most
            effectively hear and respond to the Truth. Here we discover that Scripture has a story to tell—
            the Story of Salvation: creation, fall, redemption, and new creation. As *the* Story becomes *our*
            story, it orients—indeed, trains—us toward God’s righteousness (2 Timothy 3:16), and through
            instruction, skill-development, and formation we become its “truth bearers” in word and deed.
          """,
          footnote: [
            number: 25,
            text: """
              Kevin J. Vanhoozer, *The Drama of Doctrine: A Canonical Linguistic Approach to Christian Theology* (Louisville KY:
              Westminster-John Knox Press, 2005), 419-420.
            """
          ],
          text: """
            As we move from the Service of the Word to the Service of the Table or Altar this Gospel story
            is expressed in form as well as content. The inner structure will, according to J. I. Packer,
            consist of three major themes in the biblical metanarrative: (1) sin, detected and confessed; (2)
            grace, proclaimed and celebrated; and (3) faith, focused and expressed. The meaning of the
            Scriptures—indeed the rule of faith itself—is found and comes alive here, providing a rich
            narrative context for proclamation, adoration, edification, and, indeed, deployment in the Great
            Commission.
          """,
          footnote: [
            number: 26,
            text: """
              J. I. Packer, “Rooted and Built Up in Christ (Col. 2:6-7): The Prayer Book Path” (Concord, Ontario: Prayer Book: [
              Society of Canada, n.d.). This essay is available as a .PDF file at <http://groups.google.com/group/anglican-catechismsub-committee/files>.
              Schmemann would agree with Packer in his assertion that the meaning of all liturgical acts,
              including blessing, thanksgiving, repentance, petition, sacrifice, entrance, etc. are given in the Scriptures, “but it is only
              through liturgy that they come alive to us in a new, unique and actual sense.” He adds: “All this means that the teaching
              of the Bible must be closely linked to liturgics, in order to make the Bible and the liturgy mutually explain, complete and
              ‘reveal’ each other.” See Schmemann, 19.
            """
          ]
        ],
        paragraphText: """
          Little wonder that a necessarily organic relationship exists between catechetical evangelism and
          liturgical catechesis. Whether starting from outside or inside the Church, these life-changing
          paths converge as they initiate and build-up individuals into Christ’s body. They share a
          common praxis (most especially the Service of the Word and the Daily Office), a common story
          (the Gospel narrative), and a common goal (discipleship). In catechetical evangelism we are
          mindful of the front-porch entry into this corporate reality, while in liturgical catechesis we tend
          to the intricate in-working and out-working of the cross-shaped sacramental life of God’s people.
          Now let us take a closer look at the distinctive Anglican features of this vision.
        """,
        section: "An Anglican Synthesis",
        paragraph: [
          text: """
            Recovery of effective catechetical practice from the undivided church requires the missiological
            discernment of an enduring solidarity, or sense of continuity, over time and place. The history is
            long and complex. Not only does the Anglican trajectory, in particular, present us with a
            bewildering diversity, but also a marked degree of confusion or, at least, contradiction regarding
            the relationship between catechesis, baptism, and confirmation.
          """,
          footnote: [
            number: 27,
            text: """
              A more detailed study of the history of Anglican catechesis is forthcoming from the Task Force. For present
              purposes, it is important to note that Anglicans have had a formal catechism from the beginning, thanks to Thomas
              Cranmer’s inclusion of an adapted Lutheran “shorter catechism” in the 1549 Book of Common Prayer. Subsequent
              modifications and expansions appeared in the more enduring 1662 form of the Catechism, and this remains the standard
              point of reference for catechetical development to this day and throughout the Anglican Communion. But there is the
              Catechism and there are catechisms! Even in Cranmer’s day a wide variety of English catechisms were in use, and the
              plethora of local adaptations escalated as Anglicanism spread to the colonies and beyond. There remains a family
              resemblance—for example, the traditional three hallmarks of Creed, Decalogue, and Lord’s Prayer remain—and the
              question-and-answer form tends to subdivide topically, with a systematic scope that includes God the Father, the Old
              Covenant, sin and redemption, God the Son, the New Covenant, God the Holy Spirit, the Scriptures, and so on. The
              study of Anglican catechesis is further complicated by a history of shifting relationships between catechesis, baptism, and
              confirmation. At times, confirmation has required extensive catechesis, at other times, catechesis has nearly fallen by the
              wayside in routine pastoral care and parish life. Not surprisingly, in mission-field situations, catechesis has preceded
              baptism at an age of accountability. More recently (since the 1970s), in the United States, catechesis has been
              subordinated to confirmation, which in-turn has been marginalized or drastically minimized (in content and overall
              emphasis) in many parishes. The Task Force Survey referenced earlier in this report reveal some of the negative
              outcomes of this trend. It is our operating assumption in the Task Force that confirmation must be inherently
              catechetical in purpose and scope—that is, it must be comprehensive in working toward our working definition of the
              ACNA Catechumenate (p. 3). Consequently, we sometimes use ‘catechetical’ as an adjective in our references to
              confirmation. For helpful historical overviews see James F. Turrell, “Catechisms,” in *The Oxford Guide to the Book of
              Common Prayer*, eds. Charles Hefling and Cynthia Shattuck (Oxford: Oxford University Press, 2006): 500-508; and Ian
              Green, *The Christian’s ABC: Catechism and Catechizing in England*, c. 1530-1740 (Oxford: Clarendon Press, 1996). ]
            """
          ],
          text: """
            Still, it is possible to draw a
            distinctively Anglican map of the intersecting pathways previously described—whether from the
            front-porch or from the font. These converge in, and constitute, what Tory Baucum refers to as a
            “faith culture.” As we reflect, historically and theologically, on the internal dynamics of this
            culture, we recognize the guiding principles for an authentically Anglican catechumenate today.
          """
        ]
      ],
      page82: [
        paragraph: [
          text: """
            In his dual role as reformer and Archbishop of Canterbury, Thomas Cranmer set about the task
            of redefining (and restoring) conversion as a continual reorientation of the believer’s heart
            around the dynamic principle of grace and gratitude. In this way, according to Ashley Null,
            “divine gracious love, constantly communicated by the Holy Spirit in the regular repetition of
            scripture’s promises through Word and Sacrament, was to inspire grateful human love, drawing
            believers towards God, their fellow human beings and the lifelong pursuit of godliness.”
          """,
          footnote: [
            number: 28,
            text: """
              28 Ashley Null, “Thomas Cranmer and the Anglican Way of Reading Scripture,” Anglican and Episcopal History vol. 75
              (2006): 514.
            """
          ],
          text: """
            That’s quite an agenda! In practice, Cranmer assumed it was best achieved in the formative context of
            the Church’s liturgy, hence his great concern regarding the need for a reformed prayer book. In
            effect, he would have identified most closely with liturgical catechesis, as described above—
            especially given the cradle-to-grave scenario that was assumed in an established Church (and
            Christendom) setting.
          """,
          footnote: [
            number: 29,
            text: """
              Cranmer did not think of evangelism in an exclusively individualized sense (as we often do today), nor did he view the: [
              Church as a mission-outpost in an alien culture. His ecclesiastical understanding was shaped by late medieval
              Christendom—albeit a Christendom in need of serious repair. Thus, his mandate was to evangelize a nation according
              to the gospel of justifying grace in Jesus Christ. For a helpful discussion of the wider social dimensions of Cranmer’s
              reform agenda see, especially, Ashley Null, “Thomas Cranmer and Tudor Evangelicalism,” in *The Advent of Evangelicalism:
              Exploring Historical Continuities*, eds. Michael A. G. Haykin and Kenneth J. Stewart (Nashville, Tennessee: B&H Academic,
              2008): 221-251.
            """
          ],
          text: """
            Let us briefly consider this from the standpoint of his prayers and his
            understanding of the role of Scripture.
          """
        ]
      ],
      page83: [
        paragraph: [
          text: """
            First, his prayers seek divine assistance so that the reading and proclamation of God’s Word will
            bring forth “loving holiness” in individuals and in the whole people of God. In the Litany, for
            example: “That it may please thee to give all thy people increase of grace, to hear meekly thy
            word, and to receive it with pure affection, and to bring forth the fruits of the Spirit.” At Holy
            Communion: “And to all thy people give thy heavenly grace, and especially to this congregation
            here present, that with meek heart and due reverence they may hear and receive thy holy word,
            truly serving thee in holiness and righteousness all the days of their life.” And in the
            Confirmation service: “Almighty everliving God, which makest us both to will, and to do those
            things that be good and acceptable unto thy Majesty… let thy Holy Spirit ever be with them; and
            so lead them in the knowledge and obedience of thy word.”
          """,
          footnote: [
            number: 30,
            text: "Cranmer, quoted in Null, “Thomas Cranmer and the Anglican Way,” 514-515."
          ]
        ],
        paragraph: """
          Second, with regard to the role of Scripture, Cranmer’s “Preface” to the Great Bible is most
          particular. Null elaborates:
        """,
        quote: [
          text: """
            … the scriptures were “the fat pastures of the soul” and the “most holy relic that remaineth upon earth.”
            Here the English people would find everything they needed to learn about God and their own situation.
            Here they would experience the transforming power of the Holy Spirit to give them new life in this world
            as well as eternal life in the world to come. Here they would find the power to love their neighbor as
            themselves and so improve their society. Here they would meet God, becoming one with him in their
            hearts, forever.
          """,
          footnote: [number: 31, text: "Ibid., 515-516.:"]
        ],
        paragraph: [
          text: """
            Cranmer directly associated conversion with a transforming response to the reading and hearing
            of Scripture in an atmosphere saturated with prayer. This explains why catechesis itself became
            so strongly associated with the Daily Office. Biblical literacy was chiefly understood in terms of
            knowing the major passages and narratives of the Bible, its dual-canonical organization, and its
            “sufficiency” in containing “all things necessary to salvation.” But Cranmer also thought such a
            level of acquaintance with Scripture would enable the disciple to “continue, proceed, and prosper
            from time to time, showing oneself to be a sober and fruitful hearer and learner. Which if he do,
            he shall prove at the length well able to teach, though not with his mouth, yet with his living and
            good example…”
          """,
          footnote: [number: 32, text: "Cranmer, “Preface to the Great Bible,” 1540."],
          text: """
            By the seventeenth century, in fact, Evening Prayer became the primary
            context for catechetical instruction, with lessons and sermons focusing on the traditional
            headings of the prayer book catechesis. A new rubric in the 1662 *Book of Common Prayer*
            mandated that after the second lesson, catechizing was to be done openly, during the service.
            This pattern continued until the nineteenth century invention of Sunday School.
          """,
          footnote: [number: 33, text: "Turrell, 503-504.:"]
        ],
        paragraph: """
          This development provides some cues for adapting Cranmer’s practical theology to the missional
          realities of the front-porch. Clearly the morning and/or evening offices have, historically, been
          understood to serve a catechetical function—as a delivery system, of sorts, for biblical faith. In
          translating to a broad range of catechetical contexts, we would want to account for the
          *disposition*, *direction*, and *discipline* of Cranmer’s practical theology, as set forth in the Daily
        """
      ],
      page84: [
        paragraph: [
          text: "Office.",
          footnote: [
            number: 34,
            text: """
              Philip Harrold, “The Ancient Wisdom of Catechumenate with Some Anglican Echoes in Cranmer,” *Trinity Journal for
              Theology & Ministry*, vol. 3, no. 2 (Fall 2009).
            """
          ],
          text: """
            We see these features woven together in Cranmer’s classic homily entitled “A Short
            Declaration of the True, Lively, and Christian Faith”:
          """
        ],
        point: """
          • a new *disposition*: “a true trust and confidence of the mercy of God,” which enables us
          to “return again unto [Christ] by true repentance.” Cranmer grounded this proper
          confidence in an understanding “. . . that [God] doth regard us and that he is careful over
          us, as the father is over the child whom he doth love, and that he will be merciful unto us
          for his only Son’s sake, and that we have our Saviour Christ our perpetual Advocate and
          Priest in whose only merits, oblation, and suffering we do trust that our offences be
          continually washed and purged whensoever we, repenting truly, do return to him with our
          whole heart.” This disposition suggests a fundamental reorientation of life . . .
        """,
        point: """
          • a new *direction*: “steadfastly determining with ourselves through [God’s] grace to obey
          and serve him in keeping his commandments and never to turn back again to sin.”
          Cranmer was convinced that our trust and confidence in God turn us toward him; we find
          ourselves re-oriented according to the pattern of Christ’s life, which is marked by
          obedience and love . . .
        """,
        point: """
          • a new *discipline*: “Such is the true faith that the scripture doth so much commend; the
          which, when it seeth and considereth what God hath done for us is also moved through
          continual assistance of the Spirit of God to serve and please him, to keep his favour, to
          fear his displeasure, to continue his obedient children, showing thankfulness again by
          observing or keeping his commandments and that freely, for true love chiefly and not for
          dread of punishment or love of temporal reward, considering how clearly without our
          deservings we have received his mercy and pardon freely.” As the Holy Spirit enables
          us, we live to serve and please God with an obedience motivated by love. This obedience
          is marked by a training in righteousness—what we might call the life of a disciple.
        """,
        paragraph: [
          text: """
            Notice that the disposition is expressed in *repentance* out of loving gratitude to God for his
            saving *grace* in Jesus Christ. This new direction of life continues to be sustained by grace, and
            the discipline or daily working out of discipleship is motivated by a *faith* working through love.
            This establishes a fundamental pattern in Cranmer’s theology of conversion and provides the
            ‘DNA’ for an Anglican Catechumenate.
          """,
          footnote: [
            number: 35,
            text: """
              J. I. Packer, Introduction to *The Work of Thomas Cranmer* (Berkshire, England: Sutton Courtenay Press, 1971): xxvi.
            """
          ],
          text: """
            The ‘three-D’s’ account for the relational dynamics,
            growth, and patterned life that mark the journey from the front-porch as readily as the font.
            Both converge in the sacramental life and Gospel-mission of the Church, glorifying God and
            “stirring-up godliness.”
          """,
          footnote: [
            number: 36,
            text: """
              Recall from Cranmer’s Preface to the *Book of Common Prayer* (1549) that “such Ceremonies” are primarily meant for: [
              “the setting forth of God’s honour and glory, and to the reducing of the people to a most perfect and godly living.”
            """
          ],
          text: """
            For this reason, we see the three-D’s as necessary to the development
            and sustaining of a distinctively Anglican “faith culture.”
          """,
          footnote: [
            number: 37,
            text: """
              What Cranmer did—and this is of crucial importance for recovering the genius of the Anglican Way—was situate 
              conversion, now properly guided by a recovery of the Gospel, within the “catholic order” of the historic Church. He
              wove a powerful Gospel narrative back into the fabric of a durable tradition that had, over the centuries, worked out the 
              intricacies of disciple-making in the everyday life of God’s People. Again, the Story invites us to: (1) face our utter need
              of Christ; (2) acknowledge God’s merciful provision of Christ; and (3) express our trustful, thankful response in word
              and deed toward God and neighbor. See Packer, “Rooted and Built Up in Christ,” 2.
            """
          ]
        ]
      ],
      page85: [
        picture: "PICTURE GORES HERE - ‘DNA’ for an  Anglican  Catechumenate",
        paragraphText: """
          The ‘faith culture’ constituted by the ‘Story’ will still need a front-porch—a vital practice of
          evangelical hospitality suited to the un-churched in a post-Christian and, certainly, postChristendom
          world. The porch serves as an entry point to the household of faith, to the
          sacramental life and Gospel-mission formed, sustained, and deployed by the liturgical catechesis
          of the Church. Here one realizes full participation in “the one life of the one family in every age
          and place.” This was Cranmer’s vision, and it continues to inform and inspire us today as we
          think missionally about the catechumenate.
        """
      ],
      page86: [
        section: "Guiding Principles for the Catechesis Task Force",
        paragraphText: """
          The principles listed below will guide the work of the Catechesis Task Force as it responds to the three-fold charge
          given by the ACNA Education Task Force: (1) to encourage lifelong spiritual growth and learning: emphasizing the
          hallmarks of genuine discipleship, and especially a transformative apprenticeship (or follower-ship) to Jesus Christ;
          (2) to develop a comprehensive catechumenal vision and framework, which will include a common catechism: this
          will be submitted for approval and implementation throughout ACNA; (3) to facilitate the collection and/or
          production of Christian education materials, curricula, etc. that serve this catechumenal end.
        """,
        ordered_list: [
          text: """
            1. Working definition: the ACNA Catechumenate seeks, welcomes, instructs, trains, forms,
            and deploys Christians who pursue, in the power of the Holy Spirit, the call of Jesus to live
            according to his gospel as citizens in his kingdom and members of his body, the Church.
            Accordingly, the Catechumenate is realized in: (i) the call to new identity ('
          """,
          ref: "Galatians 4:6-7",
          text: ") and new community (",
          ref: "I Peter 2:9-10",
          text: ") to live to the praise of God’s glory (",
          ref: "Ephesians 1:3-14",
          text: "); (ii) the call to faithful witness (",
          ref: "Jude 3",
          text: ") and endurance (",
          ref: "Matthew 10:22",
          text: "); (iii) the call to holiness (",
          ref: "I Peter 1:13-16",
          text: ") and stewardship (",
          ref: "Matthew 25:14",
          text: "); and (iv) the call to ministry (",
          refs: ["Romans 12:4-8", "Galatians 6:10"],
          text: ") and mission (",
          refs: ["Acts 1:8", "Matthew 5:13-16"],
          text: ")."
        ],
        ordered_list: [
          text: "2. The call to new identity and new community:",
          list: [
            """
              • The Catechumenate will be continually informed by the inner structure (or ‘DNA’) of
              classic Anglican worship—repentance, grace, faith.
            """,
            """
              • This DNA will generate the form and content of catechetical evangelism (on the
              ‘front-porch’ as it extends into the local mission field) and liturgical catechesis (from
              the ‘font’) in making disciples of Jesus Christ.
            """
          ]
        ],
        ordered_list: [
          text: "3. The call to faithful witness and endurance:",
          list: [
            text: """
              • The Catechumenate will recognize the historic patterns and content of catechesis and
              confirmation and provide guidance and resources in adapting these disciple-making
              pathways to local needs and circumstances in the Church, church plants/missions, the
              family, and the varied relational networks of the mission field.
            """,
            text: """
              • At the heart of these historic patterns is a comprehensive program of biblical
              instruction, skill development (especially reading the Scriptures and responding), and
              formation in biblical and historical faith.
            """
          ]
        ],
        ordered_list: [
          text: "4. The call to holiness and stewardship:",
          list: [
            text: """
              • The Catechumenate will support a “faith culture” that embodies the Gospel of Jesus
              Christ in the belief, belonging, and behavior of disciples and disciple-making
              communities.
            """,
            text: """
              • This culture will be defined vertically by Triune worship and horizontally by
              evangelical hospitality and mission to the unreached.
            """
          ]
        ],
        ordered_list: [
          text: "5. The call to ministry and mission:",
          list: [
            text: """
              • The Catechumenate will initiate and sustain individuals in the sacramental life of the
              Church, incorporating them into the Body of Christ.
            """,
            text: """
              • This incorporation involves their gifting, training, and deployment as disciples who
              make disciples of Jesus Christ.
            """
          ]
        ],
        page87: [
          section: "Glossary",
          columns: [
            "*Anglican ‘DNA’:*",
            """
              at the heart of Thomas Cranmer’s theology and liturgical genius is the gospel of
              justification by faith, which can be succinctly defined in a “sin-grace-faith” sequence (as
              articulated by J. I. Packer; herein the term ‘repentance,’ the acknowledgement of sin, is
              substituted for ‘sin’). In the classical expression of Cranmer’s homilies, this three-fold
              order of salvation is indicated in a disposition that begins in *repentance*, a direction that is
              sustained by *grace*, and a discipline that is motivated by *faith* working through love.
            """
          ],
          columns: [
            text: "*Biblical literacy:*",
            text: """
              an essential goal of the Anglican Catechumenate is attaining knowledge of the major
              passages and narratives of the Bible, its dual-canonical organization, and its “sufficiency”
              in containing “all things necessary to salvation.” Cranmer thought such a level of
              acquaintance with Scripture would enable the disciple of Jesus Christ to be a “sober and
              fruitful hearer and learner,” as well as a witness of God’s Word in “his [or her] living and
              good example.”
            """
          ],
          columns: [
            text: "*Catechumenate-catechesis-catechism:*",
            text: """
              catechumenate is the overall operational framework in which catechesis
              (instruction) and catechism (the instrument[s] of instruction) function. A catechumenate
              necessarily accounts for activities and processes that form and equip Christians, whether
              pre- or post-baptism.
            """
          ],
          columns: [
            text: "*Catechetical evangelism:*",
            text: """
              this catechetical pathway highlights the transformative process of becoming a Christian
              (conversion) in an evangelistic and, at least initially, un-churched situation. Individuals
              are led through a series of preparatory stages and rites of passage that culminate in
              baptism and initiation into the full sacramental life and Gospel-defined mission of the
              Church. Some refer to this as “protocatechesis” because it is targeted at seekers.
            """
          ],
          columns: [
            text: "*Conversion:*",
            text: """
              a turning around or transformation from one life direction to another, most especially
              through repentance and faith (Acts 3:19). This transformation of whole persons begins
              when they become followers of Jesus Christ as Lord and Savior. But there is also a
              continuous aspect of conversion which Thomas Cranmer understood to be an “ongoing
              reorientation of a believer’s heart.”
            """
          ],
          columns: [
            text: "*Four-stage catechesis:*",
            text: """
              the four stages of the ancient catechumenate are (1) evangelization (inquiry and
              introductory summary of the faith), (2) catechesis (long-term instruction and mentoring),
              (3) enlightenment (final pre-baptismal instruction), and (4) mystagogy (post-baptismal
              instruction concerning the rituals and deeper mysteries of the faith, especially the
              Eucharist)
            """
          ],
          columns: [
            text: "*Front-porch:*",
            text: """
              a distinctive “social space” and “faith culture” with “patterned practices that encourage
              and enable evangelical hospitality, so that those who are far from Christ may come close
              to him and discover in the hospitality of the Church the warm, reconciling welcome of
              her triune God.” (Tory Baucum). Catechetical evangelism is closely identified with the
              operation of this social space.
            """
          ],
          columns: [
            text: "*Liturgical catechesis:*",
            text: """
              this catechetical pathway is defined by conversion from ‘cradle-to-grave,’ with particular
              emphasis on the spiritual nurture of baptized children by godly parents in catechumenal
              parish settings. At their confirmation, such individuals publicly affirm their faith and
              commitment to the baptismal vows. Liturgical catechesis is also attentive to the wide
              range of necessary connections between the liturgy and catechumenate, tending to the
              mutual benefits of integrating these formative arenas in life-long growth and discipleship,
              vertically (through worship) and horizontally (through mission).
            """
          ]
        ],
        page88: [
          title: "APPENDIX V",
          center: "Vision Paper for Catechesis",
          center: "in the Anglican Church of North America",
          section: "Introduction",
          paragraph: [
            text: """
              This paper by the Catechesis Task Force provides a basic vision and outline for the process and
              content of catechesis in the Anglican Church of North America. The Task Force was formed to
              advise the College of Bishops of the Anglican Church in North America (ACNA) regarding the
              work of making and forming of disciples of Jesus Christ—catechesis. The Task Force also supports
              other recent work in the Anglican Communion concerning catechesis, such as the Anglican
              Catechism in Outline (ACIO).
            """,
            footnote: [
              number: 38,
              text: """
                “…as proposed in the Interim Report of the Global South Anglican Theological Formation and Education Task
                Force (presented to the Global South Primates Steering Committee on 6 January 2008)” (Toward an Anglican
                Catechumenate: Guiding Principles for the Catechesis Task Force, Anglican Church in North America).
              """
            ]
          ],
          paragraph: [
            text: """
              Jesus instructed the Church to disciple the nations. Conversion is at the core of this mission and
              involves repentance, a turning away from and a leaving behind of the old life, the “old man,” the old
              heart. Of course, it also involves a *turning to*; a turning to the life of Christ in us; a transformed life
              where we are, indeed, new creatures in Jesus. This is both an immediate reality in Christ, but also a
              process—a growing into Christ. Catechesis is the discipling process of growing up God’s people
              into Christ.
            """
          ],
          paragraph: [
            text: "More formally, catechesis",
            footnote: [
              number: 39,
              text: """
                Catechesis: Instruction given to Christian *catechumens preparing for *Baptism, esp. in the primitive Church. The
                word was also used of the books containing such instruction, of which the most celebrated is that of St *Cyril of
                Jerusalem. In the RC Church the word is now used for education in faith throughout life. (Cross, F. L. and Elizabeth A.
                Livingstone. *The Oxford Dictionary of the Christian Church*. 3rd ed. rev. Oxford; New York: Oxford University Press, 2005.)
              """
            ],
            text: """
             is the education and formation of Christians from before baptism
             through the end of life, and it concerns specific, scripturally based content, and also follows a
             definable process in the context of an intentional community. At each stage in the process, the same
             general content may be addressed in varying depth. This work addresses the content more broadly,
             but the stages/process more specifically. Future work will address content in more detail.
            """
          ],
          paragraph: [
            text: """
              Let us note at the outset that catechesis is and always has been rooted in Scripture. From Gospel
              narrative as introduction to the faith, to Creeds as summaries of Biblical theology, to traditional
              teaching on moral living, the Church instructs her children out of Scripture.
            """,
            footnote: [
              number: 40,
              text: """
                With the understanding that Scripture and the early fathers are basic to this endeavor, a primary modern text to which
                this paper refers is *Grounded in the Gospel: Building Believers the Old-Fashioned Way*, by J. I. Packer and Gary A. Parrett. This
                text draws upon Scripture and ancient sources, while being itself contemporary and readily accessible. We employ
                certain terms used by the ancient Church, but which may be foreign to contemporary Christians, such as “catechumen,”
                “neophyte,” and “candidates.” This is in a hope to avoid both ambiguity and a current and faddish terminology, which
                may be in vogue today, but tomorrow may be dated.
              """
            ]
          ],
          paragraphText: """
            Because the Anglican Church has had an excellent synthesis of Word and Sacrament over its history,
            both before and after the Reformation, the task of catechesis can best be viewed through that
            classical Anglican lens. It is a catholic lens using the Church’s best examples of that synthesis
            throughout the centuries, and a reformed lens as manifested by the English Church in her
            reformation.
          """
        ],
        page89: [
          paragraphText: """
            The three traditional subject areas of catechesis are the Creeds, the Lord’s Prayer and the Ten
            Commandments. These areas provide the content for instruction. Distinct but not separate in the
            life of the individual being formed in the life of the Church and into the image of Christ, is the
            sacramental pathway of God’s grace. God’s grace is made manifest in the Word read and taught,
            and it is likewise made manifest in the sacramental life of His Church. It is worth noting that the
            three subject areas and the sacraments are all a part of the corporate worship of the Church.
          """,
          paragraphText: """
            An individual needs the didactic teaching and repetition of the Creeds: to be constantly rehearsing
            the doctrines of salvation. He needs, too, the experience of the Creeds in worship and grace: the
            sacramental pathway one “lives into” as one grows in Christ. Baptism and confirmation bring the
            individual into the life of the Church, incorporate him into the body of Christ, and regenerate him to
            new life. The grace of God in baptism is necessary, but it is not enough. Teaching and
            understanding are also necessary. The grace of God works through the sacraments and also through
            the teaching of the Word.
          """,
          paragraph: [
            text: """
              The Holy Communion feeds God’s people “in an heavenly manner” with the Body and Blood of
              Christ. Christ is really given to the faithful in the Holy Communion. This is the continued grace of
              God in the believer’s life which, co-working with the work of the Holy Spirit in the ministry of the
              Word, continues to sanctify and grow the believer, with the Church of Jesus as a whole, “till we all
              come to the unity of the faith and of the knowledge of the Son of God, to a perfect man, to the
              measure of the stature of the fullness of Christ.”
            """,
            footnote: [number: 41, text: "NKJV, Eph 4:13"]
          ],
          paragraphText: """
            Catechesis, being the nurturing and formation of Christians over the course of their whole lives,
            always has been and must be done in the context of both Word and Sacrament. The classical
            Anglican way provides an excellent context for this formation.
          """
        ],
        section_list: [
          text: "Problem",
          footnote: [
            number: 42,
            text: """
              For a more complete treatment of the problem and a call to action, see the Catechesis Manifesto produced by the 
              Catechesis Task Force entitled: “The Time for Catechesis is Now!”
            """
          ]
        ],
        paragraphText: """
          Why this focus on catechesis? Simply put, the contemporary Church has failed to train up her
          children in the admonition of the Lord. Children raised in the Church from the font of baptism
          often abandon the faith when they graduate high school and move away from home. This
          consistent problem in late 20th/early 21st century Anglicanism, and North American Christianity in
          general, tells us that the typical educational program—including the curriculum, youth ministry,
          Sunday school program for all ages and Bible Studies—of the average parish is deficient in raising up
          a godly generation to build, lead, and serve the kingdom of God. Rather than displaying a life
          transformed by Christ in the Church, the Church’s children often show that they’ve been discipled
          effectively by the surrounding culture.
        """,
        paregraphText: """
          Moreover, the Church has done a very poor job of teaching, training, and forming disciples of adult
          converts. Many people live for years in the Church without noticeable growth in their doctrinal
          understanding and the implications of that doctrine lived out—and so with little victory over the sin
          and brokenness of their lives. A consistent and focused path has not been provided for them to
          learn, grow and mature as Christians, so that the contemporary Church is often filled with believers
          more formed by the culture of the world than by the Church and the Holy Scriptures she treasures
          and teaches. This is a fundamental lack of the Gospel transformation everyone needs.
        """
      ],
      page90: [
        paragraph: [
          text: """
            Thus, whether one looks at the lives of the children who have come from the font as young ones or
            at those who’ve come through the front porch
          """,
          footnote: [
            number: 43,
            text: """
              This two pronged approach to catechesis has been talked of by the Catechesis Task Force as a “mission-minded dual
              catechetical approach: (1) catechetical evangelism, which focuses on disciple-making in an evangelistic situation (*from the
              ‘front porch’ of the church*); and (2) liturgical catechesis, which focuses on disciple-making within the formational contexts of
              family and church (*‘from the font’*).” (“Toward an Anglican Catechumenate: Guiding Principles for the Catechesis Task
              Force, Anglican Church in North America”) See also the paragraphs following “Thinking Missionally about a
              Catechumenate.”
            """
          ],
          text: """
            of the Church in adulthood, it is clear that the
            Church is failing in this essential task of catechesis.
          """
        ],
        section: "Toward a Solution",
        paragraph: [
          text: """
            The solution is not, however, to be found in starting over and ignoring what the Church has done.
            Our age certainly suffers no lack of available materials, programs and ministry models—much of it
            creative and inventive. The programs and Sunday Schools and curricula of the last 100 years,
            however, have not formed the robust Church that many dream of. We are convinced it is time, as
            Jeremiah records, to look to the old paths.
          """,
          footnote: [
            number: 44,
            text: """
              Thus says the LORD: “Stand in the ways and see, And ask for the old paths, where the good way is, And walk in it;
              Then you will find rest for your souls….” Jer. 6:16
            """
          ]
        ],
        paragraph: [
          text: """
            The ancient Church, indeed, had a model for raising up believers and helping them to mature in
            their faith. Though actual practice may have varied through the centuries, catechesis always included
            training in the three areas of Believing, Praying, and Living (another way to put it: Doctrine,
            Worship, and Holy Living).
          """,
          footnote: [
            number: 45,
            text: """
              Packer and Parrett have demonstrated that these three elements—called by many different names—were in place in all: [
              the life of the Church (62). They note that catechesis was most effectual in the life of the Church during the 2nd
              through the 5th centuries and at the time of the Reformation in the Western Church. They also mention the Puritans of
              the 17th century as especially good at catechesis (52-68), as was the Roman Catholic Church during the Counter
              Reformation and in the late 20th century (24).
            """
          ]
        ],
        paragraphText: """
          What is needed today in the life of the Anglican Church in North America is sound and effectual
          catechesis. The calling of mother Church is to disciple and nourish her children their whole lives
          through, from cradle to grave, so that they may continue to grow in the faith, to mature and be
          sanctified, and to increase in understanding and wisdom.
        """,
        paragraphText: """
          What follows, therefore, is an outline of this process and general content of catechesis. Each parish
          is unique, but for the ACNA to flourish as a unified Church, the parishes, with their clergy and laity,
          must all share the same vision of catechesis.
        """
      ],
      page91: [
        section: "Content",
        paragraph: [
          text: "The general content of catechesis over the course of the centuries has been,",
          footnote: [number: 46, text: "*Grounded in the Gospel*, 62"],
          text: "as noted in the introduction, the Creed, the Lord’s Prayer, and the Decalogue",
          footnote: [
            number: 47,
            text: """
              Catechisms, whether Catholic or Protestant, normally contain the Creed, the *Lord’s Prayer, and the Ten
              Commandments with explanations; (F. L. Cross and Elizabeth A. Livingstone, *The Oxford Dictionary of the Christian Church*,
              3rd ed. rev. (Oxford; New York: Oxford University Press, 2005). 301.
            """
          ],
          text: """
            (or as stated above, Believing,
            Praying, and Living). All catechetical content can be seen to fit these three basic areas.
            Teaching on the Sacraments naturally falls within each of these three areas. The most obvious place
            of sacraments is in corporate worship, so teaching on sacraments would take place under the
            heading of Praying. There is also, however, much to be learned and believed about the sacraments;
            this would fall under the heading of Believing. And the sacraments equip us for practical, everyday
            holy Living.
          """
        ],
        paragraph: [
          text: """
            We have, then, under the ministry of the Word, the following breakdown of the catechetical content
            (see chart in appendix A): Believing, Praying, and Living.
          """
        ],
        ordered_list: [
          paragraph: [
            text: """
              1.Believing corresponds to Creedal Studies (foundationally Apostles’ Creed but also Nicene and
              even Athanasian) and the doctrines and teaching of the Church (the Hermeneutical
              Tradition
            """,
            footnote: [
              number: 48,
              paragraphText: """
                The Convocation of 1571, which passed the XXXIX. Articles in the form in which we have them now, passed also a: [
                code of Canons, in one of which is the following clause: “In the first place let preachers take heed that they deliver
                nothing from the pulpit, to be religiously held and believed by the people, but that which is agreeable to the old and new
                Testament, and such as the *Catholic fathers and ancient bishops have collected therefrom*.”
              """,
              paragraphText: """
                In like manner, in the Preface to the Ordination Service we read, “It is evident to all men reading Holy Scripture, and
                ancient authors, that from the Apostles’ time there have been three orders of Ministers in Christ’s Church, Bishops, Priests,
                and Deacons.”
              """,
              paragraphText: """
                So Archbishop Cranmer, the great reformer of our Liturgy and compiler of our Articles, writes, “I also grant that every
                exposition of the Scripture, whereinsoever the old, holy, and true Church did agree, is necessary to be believed….”
                Dr. Guest, who was appointed at the accession of Elizabeth, to restore the re- formed prayer-book, after it had been
                disused in the reign of Mary, and who reduced it to nearly its present form, writes thus: “So that I may here well say with
                Tertullian, That is truth which is first; that is false which is after. That is truly first which is from the beginning. That is
                from the beginning which is from the Apostles….” (*Browne, E. Harold. An Expositon of the Thirty-Nine Articles Historical and
                Doctrinal*. 1st ed. New York: H. B. Durand, 1865.)
              """
            ],
            text: """
              ) built upon the foundations of the Creeds (the Church’s summaries of the Holy
              Scriptures).
            """
          ],

          # end of first element
          paragraphText: """
            2.Praying corresponds to the Lord’s Prayer and teaching the catechumen how to pray and how
            to build into the life of worship in Christ’s Body, including participation in the Sacramental
            life of the Church.
          """,
          paragraphText: """
            3.Living corresponds to the Decalogue and ethical and moral living out of the faith with
            constant life reference to doctrinal (creedal) and sacramental and prayer life (Lord’s Prayer)
            realities.
          """
        ],
        paragraph: """
          Obviously, each of these three areas informs the believer’s total faith encounter with God and how
          he lives out that encounter.
        """,
        paragraph: [
          text:
            "Sacraments (see fourth column of chart in appendix A) are by their nature physical and spiritual,",
          footnote: [
            number: 49,
            text: """
              From the Catechism of the 1662 BCP: Question. What meanest thou by this word Sacrament?"
              Answer. I mean an outward and visible sign of an inward and spiritual grace given unto us, ordained by Christ himself,
              as a means whereby we receive the same, and a pledge to assure us thereof.
            """
          ],
          text: """
            and thus they touch on the other three areas of catechetical content. The sacramental life as a whole
            is the intersection of Believing, Praying, and Living: we believe truths about the sacraments, we
            celebrate the sacraments in context of worship and prayer, and we ought to live out the grace of
            sacraments in a manner worthy of that grace.
          """
        ]
      ],
      page92: [
        paragraphText: """
          The foundation of the Holy Scriptures in all areas of study, learning and formation has been
          mentioned and may be reiterated. Continual building upon the Scriptural foundation and constant
          reference to the Scriptures are the norm for catechetical formation. When the Church is healthy and
          forming healthy disciples, from the ancient Church to the contemporary Church, her teaching is
          scripturally sound.
        """,
        section: "Process",
        paragraph: [
          text: """
            Catechesis takes place through the whole Christian life, in stages appropriate to the individual’s
            development in the faith
          """,
          footnote: [
            number: 50,
            text: """
              see content under the header “Catechetical Evangelism,” (“Toward an Anglican Catechumenate: Guiding Principles: [
              for the Catechesis Task Force, Anglican Church in North America”).
            """
          ],
          text:
            ". Broadly speaking, the early Church developed the following stages: proto-catechesis,",
          footnote: [
            number: 51,
            paragraphText: "Packer & Parrett, 54",
            paragraphText: """
              “Augustine argued that catechists should set before inquirers the great *narratio* of the Scriptures, and grand story of
              God’s redemptive dealings with mankind” (ibid. 221).          
            """,
            paragraphText: """
              “…An individual seeking membership in a local household of faith had to go through a long period of catechesis prior
              to baptism. This process was marked by four stages: (1) *evangelization* (inquiry and introductory summary of the faith)…”
              (“Toward an Anglican Catechumenate: Guiding Principles for the Catechesis Task Force, Anglican Church in North
              America”).
            """
          ],
          text: "involving instruction for inquirers; the catechumen",
          footnote: [
            number: 52,
            text: """
              catechumens (Gk. ).
              In the early Church those undergoing training and instruction preparatory
              to Christian *Baptism. (F. L. Cross and Elizabeth A. Livingstone, *The Oxford Dictionary of the Christian Church*, 3rd ed. rev.
              (Oxford; New York: Oxford University Press, 2005). 302.)
            """
          ],
          text: "stage; the stage of the elect",
          footnote: [
            number: 53,
            text: """
              competentes (‘those qualified’). In the early Church *catechumens admitted to the final stage of preparation for
              *Baptism. They were also known as ‘electi’, or, in the E., as ‘those being illuminated’ ().
              (1 F. L.
              Cross and Elizabeth A. Livingstone, *The Oxford Dictionary of the Christian Church*, 3rd ed. rev. (Oxford; New York: Oxford
              University Press, 2005). 392.)
            """
          ],
          text:
            "(those who have had their name added to the list of candidates for baptism); the neophyte",
          footnote: [
            number: 54,
            text: """
              neophyte (Gk. , lit. ‘newly planted’). The word occurs in 1 Tim. 3:6 in the sense of ‘newly converted’
              and was generally used in the early Church of the recently baptized. In acc. with the biblical admonition not to make a
              neophyte a bishop, the First Council of *Nicaea ( 325, can. 2) postponed the admission of neophytes to holy orders until
              the bishop deemed them sufficiently strong in the faith. (F. L. Cross and Elizabeth A. Livingstone, The Oxford Dictionary
              of the Christian Church, 3rd ed. rev. (Oxford; New York: Oxford University Press, 2005). 1143.)
            """
          ],
          text: """
            stage for
            the newly baptized; and, of course, there were mature believers, called in this document, “the
            faithful.”
          """
        ]
      ],
      page93: [
        paragraph: [text: "The Catechesis Task Force has delineated five stages in Catechesis:"],
        paragraph: [text: "**Inquirers** (stage of proto-catechesis, leading to conversion)"],
        paragraph: [
          text: "**Catechumens** (formal training in preparation for baptism and/or confirmation)"
        ],
        paragraph: [text: "**Candidates** (*Competentes*/candidates for baptism)"],
        paragraph: [
          text: "**Newly Initiated** (the recently baptized/confirmed, stage of early mystagogy)"
        ],
        paragraph: [
          text: "**The Faithful** (stage of *mystagogy*)",
          footnote: [
            number: 55,
            text: """
              Technically, mystagogy often refers to the neophyte stage, as they move into the mysteries of the sacramental life. In this
              paper, however, mystagogy is used to refer to the continual deepening of one’s faith and moving into the deeper mysteries
              of that faith throughout the rest of one’s life.
            """
          ]
        ],
        section: "INQUIRERS",
        paragraphText: """
          An Inquirer simply wants to know about the faith, and has made no commitment to it yet. He is, we
          might say, still on the front porch of the church, watching, questioning, listening. The content for
          this stage is simply the Gospel narrative, the story of Jesus: His incarnation, life, death, resurrection,
          and ascension, and the call these events make on our lives. Someone in this stage may also be part of
          a program or course such as the Alpha Course or Christianity Explored.
        """,
        section: "CATECHUMENS",
        paragraphText: """
          Catechumens have made a commitment to become members of the Church either through baptism
          and confirmation, or through confirmation alone. They have moved from simply inquirers to those
          ready to commit to learning and growing. As in the ancient Church, a rite of initiation accompanies
          this step, and the learning commences in a structured and formal way, usually lasting about a year.
        """,
        section: "CANDIDATES",
        paragraphText: """
          Historically called Competentes, those Catechumens who are ready for baptism are called Baptismal or
          Confirmation Candidates. This group undergoes an intensive Lenten study to finish off their
          preparation for the rite of baptism and/or confirmation. Then, traditionally, the rite takes place at
          Easter, and the Catechumen enters the next stage of growth in Christ, becoming the Newly Initiated.
        """,
        section: "NEWLY INITIATED",
        paragraphText: """
          Neophytes, as they were called in the early Church, are taught extensively and are formed in a life of
          prayer and spiritual disciplines. This important time after baptism lays the foundation for a future
          life of growth and learning in Christ. The new Christian can now put together his earlier learning
          with the sacramental living into which he may now enter fully.
        """,
        section: "THE FAITHFUL",
        paragraphText: """
        After this foundation time in the new Christian’s life, he moves into the stage of the faithful, where
        he pursues the joys and mysteries of lifelong discipleship in the faith.
        """
      ],
      page94: [
        section: "Community",
        paragraph: """
          In an age of hyper-individualism, where the self is the exalted god of the age, we must state certain
          things which would have been taken for granted in centuries past. We therefore have to emphasize
          that catechesis takes place within the community of the local church; it is not primarily an
          intellectual pursuit to be gone about in private with a stack of books. Catechesis is formation and
          education of the heart, head, body, emotions, and will—in short, the whole person. Furthermore, a
          student becomes like his teacher—not his curriculum—and iron sharpens iron. A new believer
          cannot grow into maturity without teachers and friends in the body of the Christ.
        """,
        section: "Conclusion",
        paragraph: [
          text: "“The church of God will never be preserved without catechesis.”",
          footnote: [number: 56, text: "qtd. in Packer and Parrett, 23"],
          text: """
            So said John Calvin. True of the
            church at large, it is also true of our branch of it, the Anglican Church of North America. The
            ACNA must formulate and implement a plan for successful catechesis if she wants to see her desire
            for many faithful children come to fruition. The plan outlined here, albeit briefly, can be seen to
            have several merits:
          """
        ],
        ordered_list: [
          text: "1. It is ancient, not based on contemporary whim.",
          text:
            "2. It is in keeping with realities of the Faith—it encompasses sacraments, doctrine, worship, practical life.",
          text:
            "3. It takes into account the Christian’s progress in the Faith, from the inquirer to the faithful.",
          text: "4. It is tested & proven."
        ],
        paragraphText: """
          Let us go boldly forward, then, in the hope that God will use the work of men to the strengthening
          of His Church, as He has done so often before.
        """
      ],
      page95: [
        section_list: [
          text: "Appendix A57",
          foot_note: [number: 57, text: "Chart is Adapted from Packer and Parrett, 166"]
        ],
        picture: "CHART GOES HERE"
      ]
    ]
  end

  # end of build
end

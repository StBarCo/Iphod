defmodule CateQuestions do
  def start_link, do: Agent.start_link(fn -> build() end, name: __MODULE__)
  def identity(), do: Agent.get(__MODULE__, & &1)

  def question(n) do
    key = "question#{n}" |> String.to_atom()
    identity[key]
  end

  def build do
    %{
      question1: %{
        title: "What is the Gospel?",
        paragraph: [
          text: """
            The Gospel is the good news of God loving and saving lost mankind through the ministry in
            word and deed of his Son, Jesus Christ. (
          """,
          ref: "1 Cor. 15:1-4",
          ref: "Romans 5:15",
          ref: "John 1:12",
          ref: "1 John 5:11-12",
          text: ")"
        ]
      },
      question2: %{
        title: "What is the human condition?",
        paragraph: [
          text: """
            The universal human condition is that, though made for fellowship with our Creator, we
            have been cut off from him by self-centered rebellion against him, leading to guilt, shame,
            and fear of death and judgment. This is the state of sin. (
          """,
          ref: "Genesis 3",
          ref: "Romans 3:23",
          text: ")"
        ]
      },
      question3: %{
        title: "How does sin affect you?",
        paragraph: [
          text: """
            Sin alienates me from God, my neighbor, God’s good creation, and myself. I am hopeless,
            guilty, lost, helpless, and walking in the way of death. (
          """,
          ref: "Isaiah 59:2",
          ref: "Romans 6:23",
          text: ")"
        ]
      },
      question4: %{
        title: "What is the way of death?",
        paragraph: [
          text: """
            The way of death is a life empty of God’s love and life-giving Holy Spirit, controlled by
            things that cannot bring me eternal joy, but that lead only into darkness, misery and eternal
            condemnation. (
          """,
          ref: "Romans 1:25",
          ref: "Proverbs 14:12",
          ref: "John 8:34",
          text: ")"
        ]
      },
      question5: %{
        title: "Can you mend your broken relationship with God?",
        paragraph: [
          text: """
            No. I have no power to save myself, for sin has corrupted my conscience and captured my
            will. Only God can save me. (
          """,
          ref: "Ephesians 2:1-9",
          ref: "John 14:6",
          ref: "Titus 3:3-7",
          text: ")"
        ]
      },
      question6: %{
        title: "What is the way of life?",
        paragraph: [
          text: """
            The way of life is a life directed toward loving and responding to God the Father and his
            Son, Jesus Christ, in the power of God’s indwelling Holy Spirit, and leading to eternal life.
            (
          """,
          ref: "John 14:23-26",
          ref: "Colossians 1:9-12",
          ref: "Ephesians 5:1-2",
          ref: "Romans 12:9-21",
          text: ")"
        ]
      },
      question7: %{
        title: "What does God want to give you?",
        paragraph: [
          text: """
            God wants to reconcile me to himself, to free me from captivity to sin, to fill me with
            knowledge of him, to make me a citizen of his Kingdom, and to enable me to worship,
            serve, and glorify him now and forever. (
          """,
          ref: "1 John 5:11-12",
          ref: "1 Corinthians 5:19",
          ref: "Ephesians 2:19",
          ref: "Ephesians 3:19",
          ref: "Colossians 1:9",
          text: ")"
        ]
      },
      question8: %{
        title: "How does God save you?",
        paragraph: [
          text: """
            God saves me by grace, which is his undeserved love given to me in and through Jesus.
            “God so loved the world, that he gave his only Son, that whoever believes in him should not
            perish but have eternal life.” (
          """,
          ref: "John 3:16",
          text: ")"
        ]
      },
      question9: %{
        title: "Who is Jesus Christ?",
        paragraph: [
          text: """
            Jesus is my Savior, fully divine and fully human. He bore my sins, dying in my place on the
            cross, then rose from the dead to rule as anointed king over me and all creation. (
          """,
          ref: "Colossians 1:15-26",
          text: ")"
        ]
      },
      question10: %{
        title: "Is there any other way of salvation?",
        paragraph: [
          text: "No. The Apostle Peter said of Jesus, “There is salvation in no one else” (",
          ref: "Acts 4:12",
          text: "). Jesus is the only one who can save me and reconcile me to God. (",
          ref: "1 Timothy 2:5",
          text: ")"
        ]
      },
      question11: %{
        title: "How should you respond to the Gospel of Jesus Christ?",
        paragraph: [
          text:
            "I should repent of my sins and put faith in Jesus Christ as my Savior and my Lord. (",
          ref: "Romans 10:9-10",
          ref: "Acts 16:31",
          text: ")"
        ]
      },
      question12: %{
        title: "What does it mean for you to repent?",
        paragraph: [
          text: """
            To repent means that I have a change of heart, turning from sinfully serving myself to
            serving God as I follow Jesus Christ. I need God’s help to make this change. (
          """,
          ref: "Acts 2:38",
          ref: "Acts 3:19",
          text: ")"
        ]
      },
      question13: %{
        title: "What does it mean for you to have faith?",
        paragraph: [
          text: """
            To have faith means that I believe the Gospel is true;
            ref: "I acknowledge that Jesus died for m",
            sins and rose from the dead to rule over me;
            ref: "I entrust myself to him as my Savior",
            ref: "and ",
            obey him as my Lord. As the Apostle Paul said, “If you confess with your mouth that Jesus 
            is Lord and believe in your heart that God raised him from the dead, you will be saved”
            (
          """,
          ref: "Romans 10:9",
          text: ")"
        ]
      },
      question14: %{
        title: "How may a person repent and place faith in Jesus Christ?",
        paragraph: [
          text: """
            Anyone may repent and place their faith in Jesus Christ at any time. One way to do this is by
            sincerely saying a prayer similar to the Prayer of Repentance and Faith given above. (
          """,
          ref: "John 15:16",
          ref: "Acts 16:31-34",
          ref: "Romans 10:9",
          ref: "Hebrews 12:12",
          text: ")"
        ]
      },
      question15: %{
        title: "What should you do once you have turned to God for salvation in repentance and",
        paragraph: [
          text: """
            faith?
            If I have not already been baptized, following proper instruction, I should be baptized into
            the death and resurrection of Jesus Christ, and thus into membership in his Body, the
            Church. (
          """,
          ref: "Matthew 28:19-20",
          ref: "1 Corinthians 12:13",
          text: ")"
        ]
      },
      question16: %{
        title: "What does God grant in saving you?",
        paragraph: [
          text: """
            God grants me reconciliation with him (
          """,
          ref: "2 Corinthians 5:17-19",
          text: "), forgiveness of sins (",
          ref: "Colossians 1:13-14",
          text: "), adoption into his family (",
          ref: "Galatians 4:4-7",
          text: "), citizenship in his Kingdom (",
          ref: "Ephesians 2:19-21",
          ref: "Philippians 3:20",
          text: "), union with him in Christ (",
          ref: "Romans 6:3-5",
          text: "), new life in the Holy Spirit (",
          ref: "Titus 3:4-5",
          text: "), and the promise of eternal life (",
          ref: "John 3:16",
          ref: "1 John 5:12",
          text: ")"
        ]
      },
      question17: %{
        title: "What does God desire to accomplish in your life in Christ?",
        paragraph: [
          text: """
            God desires to transform me into the image of Jesus Christ my Lord, by the power of his
            Holy Spirit. (
          """,
          ref: "2 Corinthians 3:18",
          text: ")"
        ]
      },
      question18: %{
        title: "How does God transform you?",
        paragraph: [
          text: """
            He will transform me over time through corporate and private worship, prayer, and Bible
            reading;
            ref: "fellowship with God’s people",
            ref: "pursuit of holiness of life",
            ref: "witness toward those wh",
            do not know Christ;
            ref: "and acts of love toward all. The first Christians set this pattern as the",
            “devoted themselves to the apostles’ teaching and the fellowship, to the breaking of bread
            and the prayers.” (
          """,
          ref: "Acts 2:42",
          ref: "Hebrews 10:23-25",
          text: ")"
        ]
      },
      question19: %{
        title: "What is a creed?",
        paragraph: [
          text: """
            A creed is a statement of faith. The word “creed” comes from the Latin credo, which means
            “I believe.” (
          """,
          ref: "John 20:24-29",
          text: ")"
        ]
      },
      question20: %{
        title: "What is the purpose of the Creeds?",
        paragraph: [
          text: """
            The purpose of the Creeds is to declare and safeguard God’s truth about himself, ourselves,
            and creation, as God has revealed it in Holy Scripture. (
          """,
          ref: "2 Peter 1:19-21, John 20:31",
          text: ")"
        ]
      },
      question21: %{
        title: "What does belief in the Creeds signify?",
        paragraph: [
          text: """
            Belief in the Creeds signifies acceptance of God’s revealed truth, and the intention to live by
            it. (
          """,
          ref: "2 Timothy 3:14-15",
          text: ")"
        ]
      },
      question22: %{
        title: "Which Creeds does the Church acknowledge?",
        paragraph: [
          text: """
            The Church acknowledges the Apostles’ Creed, the Nicene Creed, and the Athanasian
            Creed. (
          """,
          articles_of_religion: 8,
          text: ")"
        ]
      },
      question23: %{
        title: "Why do you acknowledge these Creeds?",
        paragraph: [
          text: """
            I acknowledge these Creeds with the Church because they are grounded in Holy Scripture
            and are faithful expressions of its teaching. (
          """,
          ref: "1 Corinthians 15:3-11",
          ref: "Philippians 2:6-11",
          text: ")"
        ]
      },
      question24: %{
        title: "Why should you know these Creeds?",
        paragraph: [
          text: """
            I should know these Creeds because they state the essential beliefs of the Christian faith.
          """
        ]
      },
      question25: %{
        title: "What is the Apostles’ Creed?",
        paragraph: [
          text: """
            The Apostles’ Creed says:
            I believe in God, the Father almighty,
            creator of heaven and earth;      
            ref: "I believe in Jesus Christ his only Son, our Lord",
            He was conceived by the Holy Spirit
            and born of the Virgin Mary.
            He suffered under Pontius Pilate,
            was crucified, died, and was buried.
            He descended to the dead.
            On the third day he rose again.
            He ascended into heaven,
            and is seated at the right hand of the Father.
            He will come again to judge the living and the dead.
            I believe in the Holy Spirit,
            the holy catholic Church,
            the communion of saints,
            the forgiveness of sins,
            the resurrection of the body,
            and the life everlasting. Amen.
          """
        ]
      },
      question26: %{
        title: "What is Holy Scripture?",
        paragraph: [
          text: "Holy Scripture is “God’s Word written” (",
          articles_of_religion: 20,
          text: """
            ), given by the Holy Spirit
            through prophets and apostles as the revelation of God and his acts in human history, and is
            therefore the Church’s final authority in all matters of faith and practice. (
          """,
          ref: "2 Timothy 3:16",
          text: ")"
        ]
      },
      question27: %{
        title: "What books are contained in Holy Scripture?",
        paragraph: [
          text: """
            The thirty-nine books of the Old Testament and the twenty-seven books of the New
            Testament form the whole of Holy Scripture, which is also called the Bible and the canon.
            (
          """,
          articles_of_religion: 6,
          text: ")"
        ]
      },
      question28: %{
        title: "What is in the Old Testament?",
        paragraph: [
          text: """
            The Old Testament contains the record of God’s creation of all things, mankind’s original
            disobedience, God’s calling of Israel to be his people, God’s law, God’s wisdom, God’s
            saving deeds, and the teaching of God’s prophets. The Old Testament points to Christ,
            revealing God’s intention to redeem and reconcile the world through Christ.
          """
        ]
      },
      question29: %{
        title: "What is in the New Testament?",
        paragraph: [
          text: """
            The New Testament contains the record of Jesus Christ’s birth, life, ministry, death,
            resurrection and ascension, the Church’s early ministry, the teaching of the Apostles, and the
            revelation of Christ’s coming eternal Kingdom.
          """
        ]
      },
      question30: %{
        title: "How are the Old and New Testaments related to each other?",
        paragraph: [
          text: """
            The Old Testament is to be read in the light of Christ, incarnate, crucified and risen, and the
            New Testament is to be read in light of God’s revelation to Israel. As Saint Augustine says,
            “the New is in the Old concealed, the Old is in the New revealed.” (
          """,
          ref: "Hebrews 8:1-7",
          text: "; Augustine, Questions in the Heptateuch 2.73)"
        ]
      },
      question31: %{
        title: "What does it mean that Holy Scripture is inspired?",
        paragraph: [
          text: """
            Holy Scripture is “God-breathed,” for the biblical authors wrote under the guidance of
            God’s Holy Spirit to record God’s Word. (
          """,
          ref: "2 Timothy 3:16",
          text: ")"
        ]
      },
      question32: %{
        title: "What does it mean that the Bible is the Word of God?",
        paragraph: [
          text: """
            Because the Bible is inspired by the Holy Spirit, it is rightly called the Word of God written.
            God is revealed in his mighty works and in the incarnation of our Lord, but his works and
            his will are made known to us through the inspired words of Scripture. God “has spoken
            through the prophets” (Nicene Creed), and continues to speak through the Bible today.            (
          """,
          ref: "Hebrews 1:1-2",
          ref: "3:7-11",
          ref: "10:15-17",
          ref: "12:25-27",
          text: ")"
        ]
      },
      question33: %{
        title: "Why is Jesus Christ called the Word of God?",
        paragraph: [
          text: """
            The fullness of God’s revelation is found in Jesus Christ, who not only fulfills the Scriptures,
            but is himself God’s Word, the living expression of God’s mind. The Scriptures testify about
            him: “In the beginning was the Word” and “The Word became flesh and dwelt among us.”
            Therefore, “ignorance of the Scriptures is ignorance of Christ.” (
          """,
          ref: "John 1:1, 14",
          text: "Jerome, Commentary on Isaiah, prologue)"
        ]
      },
      question34: %{
        title: "How should Holy Scripture be interpreted?",
        paragraph: [
          text: """
            Just as Holy Scripture was not given through private interpretation of things, so it must also
            be translated, read, preached, taught, and obeyed in its plain and canonical sense, respectful
            of the Church’s historic and consensual reading of it. (
          """,
          ref: "2 Peter 1:20-21",
          text: "Jerusalem Declaration;",
          articles_of_religion: 2,
          text: ")"
        ]
      },
      question35: %{
        title: "How should belief in the God of the Bible affect your life?",
        paragraph: [
          text: """
            As I prayerfully learn Holy Scripture, I should expect the Holy Spirit to use it to teach,
            rebuke, correct and train me in the righteousness that God desires. This nourishes my soul
            toward the service of God and my neighbor. (
          """,
          ref: "2 Timothy 3:16",
          text: ")"
        ]
      },
      question36: %{
        title: "How should you use the Holy Scriptures in daily life?",
        paragraph: [
          text: """
            I should “hear, read, mark, learn, and inwardly digest them” (Book of Common Prayer) so
            that, by patience and strengthening through God’s Word, I may embrace and cling to the
            hope of everlasting life given to me in Jesus Christ. I should read and pray Scripture daily,
            that I may know God’s truth and proclaim it clearly to the whole world.
          """
        ]
      },
      question37: %{
        title: "What other books does the Church acknowledge?",
        paragraph: [
          text: """
            The canon of Holy Scripture contains all things necessary to salvation. The fourteen books
            of the Apocrypha may also be read “for example of life and instruction of manners,” but
            “not to establish any doctrine” (
          """,
          articles_of_religion: 6,
          text: ")"
        ]
      },
      question38: %{
        title: "Who is God?",
        paragraph: [
          text: """
            God is one divine Being eternally existing in three divine Persons: the Father, the Son, and
            the Holy Spirit. This is the Holy Trinity. (
          """,
          ref: "Matthew 3:16-17",
          ref: "28:19",
          text: ")"
        ]
      },
      question39: %{
        title: "According to Holy Scripture, what is the nature and character of God?",
        paragraph: [
          text: """
            “God is love” (
          """,
          ref: "1 John 4:16",
          text: """
            ). Sharing an eternal communion of love between the three
            Persons, God loves and mercifully redeems fallen creation. “God is holy” (
          """,
          ref: "Psalm 99",
          ref: "Isaiah 6:1-4",
          text: """
            ). God is utterly transcendent, good, righteous, and opposed to all sin and evil. God’s
            love is holy, God’s holiness is loving, and the Lord Jesus Christ is the fullest expression of
            God’s whole character. (
          """,
          ref: "Hebrews 1:3",
          ref: "John 1:18",
          ref: "17:21",
          ref: "Colossians 1:19",
          text: ")"
        ]
      },
      question40: %{
        title: "Who is God the Father?",
        paragraph: [
          text: """
            God the Father is the first Person of the Holy Trinity, from whom the Son is eternally
            begotten and the Holy Spirit eternally proceeds. (
          """,
          ref: "John 1:1",
          ref: "John 1:14",
          ref: "John 14:16-17",
          ref: "John 14:26",
          ref: "John 15:26",
          text: ", Nicene Creed)"
        ]
      },
      question41: %{
        title: "Why do you call the first of the three divine Persons “Father?”",
        paragraph: [
          text: """
            Our Lord Jesus called God “Father” and taught his disciples to do the same, and St. Paul
            teaches that God adopts believers as his children and heirs in Christ, sending his Holy Spirit
            into our hearts crying “Abba, Father.” (
          """,
          ref: "Matthew 6:9",
          ref: "Romans 8:15-17",
          ref: "Galatians 4:4-7",
          text: ")"
        ]
      },
      question42: %{
        title: "What do you mean when you call God “Father?”",
        paragraph: [
          text: """
            When I call God “Father,” I acknowledge that I was created by God for relationship with
            him, that God made me in his image, that I trust in God as my Protector and Provider, and
            that I put my hope in God as his child and heir in Christ. (
          """,
          ref: "Genesis1:26",
          ref: "Matthew 6:25-33",
          ref: "Romans 8:16-17",
          text: ")"
        ]
      },
      question43: %{
        title: "Why do you say that God the Father is “Almighty?”",
        paragraph: [
          text: """
            I call the Father “Almighty” because he has power over everything and accomplishes
            everything he wills. Together with his Son and Holy Spirit, the Father is all-knowing and
            ever present in every place. (
          """,
          ref: "I Chronicles 29:10-13",
          ref: "Psalm 139",
          text: ")"
        ]
      },
      question44: %{
        title: "Why do you call God the Father “Creator?”",
        paragraph: [
          text: """
            I call God the Father “Creator” because he is the sole designer and originator of everything
            that exists. He creates and sustains all things through his Word, and gives life to all creatures
            through his Spirit. (
          """,
          ref: "Genesis 1",
          ref: "Genesis 2:7",
          ref: "Job 33:4",
          ref: "John 1:1-3",
          ref: "Hebrews 1:3",
          text: ")"
        ]
      },
      question45: %{
        title: "How does recognizing God as Creator affect your understanding of his creation?",
        paragraph: [
          text: """
            I acknowledge that God made for his own glory everything that exists. He created human
            beings in his image, male and female, to serve him as creation’s stewards, managers and
            caretakers. He entrusts his good creation to us as a gift to enjoy and a responsibility to fulfill.
            (
          """,
          ref: "Genesis 1:27-28",
          ref: "2:15",
          ref: "Revelation 4:11",
          text: ")"
        ]
      },
      question46: %{
        title: "What does it mean that God made both heaven and earth?",
        paragraph: [
          text: """
            It means that all things, whether visible or invisible, physical or spiritual, were brought into
            being out of nothing by the Word of the eternal God. (
          """,
          ref: "Genesis 1:1",
          text: ")"
        ]
      },
      question47: %{
        title: "If God made the world good, why do I sin?",
        paragraph: [
          text: """
            Adam and Eve rebelled against God, thus bringing into the world pain, fruitless toil,
            alienation from God and each other, and death. I have inherited a fallen and corrupted
            human nature, and I too sin and fall short of God’s glory. (
          """,
          ref: "Genesis 3, Romans 3:23",
          ref: "5:12",
          text: ")"
        ]
      },
      question48: %{
        title: "How does sin affect you?",
        paragraph: [
          text: """
            The God-opposing, self-centered power of sin, which is present in all people, corrupts me
            and my relationship with God, with others and with creation. Because of sin and apart from
            Christ, I am spiritually dead, separated from God, under his righteous condemnation, and
            without hope. (
          """,
          ref: "Genesis 3",
          ref: "Ephesians 2:1-3",
          ref: "Galatians 5:19-21",
          text: ")"
        ]
      },
      question49: %{
        title: "Who is Jesus Christ?",
        paragraph: [
          text: """
            Jesus Christ is the eternal Word and Son of God, the second Person of the Holy Trinity. He
            took on human flesh to be the Savior and Redeemer of the world, the only Mediator
            between God and fallen mankind. (
          """,
          ref: "1 Timothy 2:5",
          ref: "John 1:14",
          ref: "14:6",
          ref: "1 Peter 1:18-19",
          text: ")"
        ]
      },
      question50: %{
        title: "What does “Jesus” mean?",
        paragraph: [
          text: """
            “Jesus” means “God saves” and is taken from the Hebrew name Yeshua or Joshua. In Jesus,
            God has come to save us from the power of sin and death. (
          """,
          ref: "Matthew 1:21",
          text: ")"
        ]
      },
      question51: %{
        title: "What does “Christ” mean?",
        paragraph: [
          text: """
            Christos is a Greek word meaning “Anointed One.” Old Testament kings, priests and
            prophets were anointed with oil. Jesus was anointed by the Holy Spirit to perfectly fulfill
            these roles and he rules now as God’s prophet, priest, and king over his Church and all
            creation. (
          """,
          ref: "Acts 10:38",
          text: ")"
        ]
      },
      question52: %{
        title: "Why is Jesus called the Father’s “only Son?”",
        paragraph: [
          text: """
            Jesus alone is God the Son, co-equal and co-eternal with God the Father and God the Holy
            Spirit. He alone is the image of the invisible Father, the one who makes the Father known.
            He is now and forever will be incarnate as a human, bearing his God-given human name.
            The Father created and now rules all things in heaven and earth “through Jesus Christ our
            Lord.” (
          """,
          ref: "Colossians 1:15",
          ref: "Hebrews 1:1-5",
          ref: "John 1:18",
          text: ")"
        ]
      },
      question53: %{
        title: "What do you mean when you call Jesus Christ “Lord?”",
        paragraph: [
          text: """
            I acknowledge Jesus’ authority over the Church and all creation, over all societies and their
            rulers, and over every aspect of my personal, social, professional, recreational, and family life.
            I surrender my life to him and seek to live every part of my life in a way that pleases him.
            (
          """,
          ref: "Colossians 1:18",
          ref: "Ephesians 1:21-22",
          ref: "Luke 9:23-26",
          text: ")"
        ]
      },
      question54: %{
        title: "How was Jesus conceived by the Holy Spirit?",
        paragraph: [
          text: """
            Through the creative power of the Holy Spirit, the eternal Son assumed a fully human nature
            from his mother, the Virgin Mary, in personal union with his fully divine nature at the
            moment of conception in Mary’s womb. (
          """,
          ref: "Luke l:34-35",
          text: ")"
        ]
      },
      question55: %{
        title: "Was Mary the only human parent of Jesus?",
        paragraph: [
          text: """
            Yes. Mary is held in honor, for she submitted to the will of God and bore the Son of God as
            her own son. However, after God told Joseph of Mary’s miraculous conception, Joseph took
            Mary as his wife and they raised Jesus as their son. (
          """,
          ref: "Matthew 1:18-25",
          ref: "Luke 1:26-38, 2:48",
          text: ")"
        ]
      },
      question56: %{
        title: "What is the relationship between Jesus’ humanity and his divinity?",
        paragraph: [
          text: """
            Jesus is both fully and truly God, and fully and truly human. The divine and human natures
            of Jesus’ Person may be distinguished but can never be separated, changed or confused. All
            that Jesus does as a human being, he also does as God;
            ref: "and before he ever became human,",
            he was eternally living and active within the unity of the Holy Trinity. (
          """,
          ref: "John 1:1-2",
          ref: "5:18;     ",
          ref: "10:30",
          ref: "14:8-9",
          ref: "Luke 2:7",
          ref: "Definition of Chalcedon",
          text: ")"
        ]
      },
      question57: %{
        title: "Why did Jesus suffer?",
        paragraph: [
          text: """
            Jesus suffered for our sins so that we could have peace with God, as prophesied in the Old
            Testament: “But he was pierced for our transgressions;
            ref: "he was crushed for our iniquities;     ",
            ref: "upon him was the chastisement that brought us peace, and with his wounds we are healed",
            (
          """,
          ref: "Isaiah 53:5",
          text: ")"
        ]
      },
      question58: %{
        title: "In what ways did Jesus suffer?",
        paragraph: [
          text: """
            On earth, the incarnate Son shared physically, mentally and spiritually in the temptations and
            sufferings common to all people. In his agony and desolation on the cross, he suffered in my
            place for my sins and, in so doing, displayed the self-denial I am called to embrace for his
            sake. (
          """,
          ref: "Hebrews 4:14-5:10",
          ref: "Mark 8:34-38",
          ref: "Philippians 2:5",
          text: ")"
        ]
      },
      question59: %{
        title: "Why does the Creed say that Jesus suffered under the Roman governor Pontius",
        paragraph: [
          text: """
            Pilate?
            The Creed thus makes clear that Jesus’ life and death were real events that occurred at a
            particular time and place in Judea in the first century A.D. (
          """,
          ref: "Matthew 27:22-26",
          text: ")"
        ]
      },
      question60: %{
        title: "What does Jesus’ crucifixion mean?",
        paragraph: [
          text: """
            It means that Jesus was executed as a common criminal. He was scourged, mocked, and
            nailed to a cross outside the walls of Jerusalem. Though humanly a miscarriage of justice, his
            execution fulfilled God’s plan that Jesus would bear my sins and die the death that I deserve,
            so that I could be saved from sin and eternal condemnation and reconciled to God.
            (
          """,
          ref: "Matthew 20:28",
          ref: "27:32-37",
          ref: "Romans 5:10-11",
          ref: "2 Corinthians 5:18-19",
          text: ")"
        ]
      },
      question61: %{
        title: "Why does the Creed make a point of saying that Jesus died?",
        paragraph: [
          text: """
            The Creed makes the point to emphasize that Jesus died a real, bodily death such as all
            people face because of our sins. (
          """,
          ref: "Matthew 27:45-51",
          text: ")"
        ]
      },
      question62: %{
        title: "Why does the Creed emphasize Jesus’ death in this way?",
        paragraph: [
          text: """
            The Creed emphasizes Jesus’ death to counter suspicions that Jesus did not truly die on the
            cross, to celebrate the fact that He died there to secure our salvation, and to prepare our
            minds to grasp the glory of his bodily resurrection.
          """
        ]
      },
      question63: %{
        title: "What does the Creed mean by saying that Jesus descended to the dead?",
        paragraph: [
          text: """
            That Jesus descended to the dead means that he truly died;
            ref: "his spirit did not remain with hi",
            body, but entered the realm of death. (
          """,
          ref: "1 Peter 3:19",
          text: ") “ON THE THIRD DAY HE ROSE AGAIN”"
        ]
      },
      question64: %{
        title: "What does the Creed mean when it affirms that Jesus rose again from the dead?",
        paragraph: [
          text: """
            It means that Jesus was not simply resuscitated;
            ref: "God restored him physically from death t",
            life in his perfected and glorious body, never to die again. His tomb was empty;
            ref: "Jesus ha",
            risen bodily from the dead. The risen Jesus was seen by his apostles and hundreds of other
            witnesses. (
          """,
          ref: "1 Corinthians 15:3-8",
          text: ")"
        ]
      },
      question65: %{
        title: "What kind of earthly life did Jesus have after he rose from the dead?",
        paragraph: [
          text: """
            Following his resurrection, Jesus spent forty days visiting and teaching his followers. He
            appeared to his disciples, spoke to them, invited them to touch him and see his scars, and ate
            with them. (
          """,
          ref: "John 20:19-23",
          ref: "Luke 24:13-49",
          ref: "Acts 1:3",
          text: ")"
        ]
      },
      question66: %{
        title: "How should you understand Jesus’ ascension into heaven?",
        paragraph: [
          text: """
            Jesus was taken up out of human sight, and returned in his humanity to the glory he had
            shared with the Father before his incarnation. There he intercedes for his people and
            receives into heavenly life all who have faith in him. Though absent in body, Jesus is always
            with me by his Spirit and hears me when I pray. (
          """,
          ref: "John 17:5",
          ref: "Acts 1:1-11",
          text: ")"
        ]
      },
      question67: %{
        title: "What is the result of the Ascension?",
        paragraph: [
          text: """
            Jesus ascended into heaven so that, through him, his Father might send us the gift of the
            Holy Spirit. Through the Holy Spirit, Christians are united as Christ’s Body on earth to Jesus,
            our ascended and living Head, and in him to one another. (
          """,
          ref: "1 Corinthians 12:12-13, 27;     ",
          ref: "Ephesians 4:15-16",
          ref: "John 14:15-29, 15:5-9",
          text: ")"
        ]
      },
      question68: %{
        title: "What does it mean for Jesus to sit at God the Father’s right hand?",
        paragraph: [
          text: """
            The throne on the monarch’s right was traditionally the seat for the chief executive in the
            kingdom. Ruling with his Father in heaven, Jesus is Lord over the Church and all creation,
            with authority to equip his Church, advance his Kingdom, bring sinners into saving
            fellowship with God the Father, and finally to establish justice and peace upon the earth.
            (
          """,
          ref: "Isaiah 9:6-7",
          ref: "32:16-18",
          ref: "Ephesians 1:22",
          ref: "4:11-12",
          ref: "Philippians 2:5-11",
          ref: "Hebrews 5:9-10",
          text: ")"
        ]
      },
      question69: %{
        title: "What does Jesus do for you as he sits at the Father’s right hand?",
        paragraph: [
          text: """
            Noting my needs and receiving my prayers, Jesus intercedes for me as our great high priest.
            Through Jesus and in his name, I am now granted access to the Father when I make my
            confessions, praises, thanksgivings and requests to him. (
          """,
          ref: "Hebrews 7:23-25",
          text: ")"
        ]
      },
      question70: %{
        title: "How does your knowledge of Jesus’ heavenly ministry affect your life today?",
        paragraph: [
          text: """
            I can rely on Jesus always to be present with me as he promised, and I should always look to
            him for help as I seek to serve him. (
          """,
          ref: "Matthew 28:20",
          text: ")"
        ]
      },
      question71: %{
        title: "What does the Creed mean when it says, “He will come again?”",
        paragraph: [
          text: """
            Jesus promised that he would return (
          """,
          ref: "Luke 21:27-28",
          text: """
            ). His coming in victory with great glory and
            power will be seen by all people and will bring this age to an end. The present world order will
            pass away and God will usher in a fully renewed creation to stand forever. All the saints will be
            together with God at that time. (
          """,
          ref: "2 Peter 3:12-13",
          ref: "Revelation 21:1-4",
          text: ")"
        ]
      },
      question72: %{
        title: "When should you expect Jesus’ return?",
        paragraph: [
          text: """
            Jesus taught that only the Father knows the actual day of his return. God patiently waits for
            many to repent and trust in him for new life;
            ref: "yet Jesus will return unexpectedly, and could retur",
            at any moment. (
          """,
          ref: "Matthew 24:36-44",
          ref: "2 Peter 3:9",
          text: ")"
        ]
      },
      question73: %{
        title: "What should be your attitude as you await Jesus’ return?",
        paragraph: [
          text: """
            I should anticipate with joy the return of Jesus as the completion of my salvation. The
            promise of his return encourages me to seek to be filled with the Holy Spirit, to live a holy
            life, and to share the hope of new life in Christ with others. (
          """,
          ref: "Titus 2:11-14",
          text: ")"
        ]
      },
      question74: %{
        title: "How should you understand Jesus’ future judgment?",
        paragraph: [
          text: """
            When the Lord Jesus Christ returns, the world as we know it will come to an end. All that is
            wrong will be made right. All people who have died will be resurrected and, together with
            those still living, will be judged by Jesus. Then each person will receive either eternal 
            rejection and punishment, or eternal blessing and welcome into the fullness of life with God.
            (
          """,
          ref: "Matthew 25:31-46",
          text: ")"
        ]
      },
      question75: %{
        title: "How should you live in light of Jesus’ coming return for judgment?",
        paragraph: [
          text: """
            Because I do not know when Jesus will come, I must be ready to stand before him each and
            every day of my life, I should eagerly seek to make him known to others, and I should
            encourage and support the whole Church, as best I can, to live in readiness for his return.
            (
          """,
          ref: "Matthew 25:1-13",
          text: ")"
        ]
      },
      question76: %{
        title: "Should you be afraid of God’s judgment?",
        paragraph: [
          text: """
            The unrepentant should fear God’s judgment, for “the wrath of God is revealed from
            heaven against all ungodliness,” but for those who are in Christ, there is no condemnation. I
            have no reason to fear the coming judgment, for my Judge is my Savior Jesus Christ, who
            loves me, died for me, and intercedes for me. (
          """,
          ref: "Romans 1:18",
          ref: "8:1, 31-34",
          text: ")"
        ]
      },
      question77: %{
        title: "What does Scripture mean when it tells you to fear God?",
        paragraph: [
          text: """
            It means that I should live mindful of his presence, walking in humility as his creature,
            resisting sin, obeying his commandments, and reverencing him for his holiness, majesty, and
            power. (
          """,
          ref: "Exodus 20:20",
          ref: "Psalm 111:10",
          ref: "Proverbs 8:13",
          ref: "9:10",
          text: ")"
        ]
      },
      question78: %{
        title: "Should you pass judgment on sinners or non-Christians?",
        paragraph: [
          text: """
            No. God alone judges those outside the Church. The Church may proclaim God’s
            condemnation of sin and may exercise godly discipline over members who are unrepentant;      
            ref: "but I am called only to judge between right and wrong, to judge myself in the light of God’",
            holiness, and to repent of my sins. (
          """,
          ref: "Matthew 7:1-5, 1 Corinthians 5:12-13",
          ref: "11:31",
          text: ")"
        ]
      },
      question79: %{
        title: "How do you judge yourself?",
        paragraph: [
          text: """
            With the help of the Holy Spirit, I judge myself by examining my conscience. I may use the
            Ten Commandments, the Sermon on the Mount, or other equivalent Scriptures, as well as
            godly counsel, to help me see my sins. (
          """,
          ref: "Exodus 20:1-17, Matthew 5:1-11",
          text: ")"
        ]
      },
      question80: %{
        title: "How does the Church exercise its authority to judge?",
        paragraph: [
          text: """
            A priest, acting under the authority of the bishop, may bar a person from receiving
            communion because of unrepented sin, or because of enmity with another member of the
            congregation, until there is clear proof of repentance and amendment of life. But the
            authority Christ gave to his Church is more often exercised by declaring God’s forgiveness in
            absolution. (
          """,
          ref: "Matthew 16:19",
          text: ")"
        ]
      },
      question81: %{
        title: "Who is the Holy Spirit?",
        paragraph: [
          text: """
            God the Holy Spirit is the third Person in the one Being of the Holy Trinity, co-equal and
            co-eternal with God the Father and God the Son, and equally worthy of our honor and
            worship. (
          """,
          ref: "Luke 11:13",
          ref: "John 14:26",
          ref: "16:7",
          text: ")"
        ]
      },
      question82: %{
        title: "What principal names does the New Testament give to the Holy Spirit?",
        paragraph: [
          text: """
            Jesus names the Holy Spirit “Paraclete” (
          """,
          ref: "the one alongside",
          text: """
            ). This signifies Comforter, Guide,
            Counselor, Advocate, and Helper. Other names for the Holy Spirit are Spirit of God, Spirit
            of the Father, Spirit of Christ, and Spirit of Truth. (
          """,
          ref: "John 14:15-17",
          ref: "Matthew 10:20",
          ref: "Roman 8:9",
          text: ")"
        ]
      },
      question83: %{
        title: "What are the particular ministries of the Holy Spirit?",
        paragraph: [
          text: """
            The Holy Spirit imparts life in all its forms throughout God’s creation, unites believers to
            Jesus Christ, indwells each believer, convicts believers of sin, applies the saving work of
            Jesus to the believer’s life, guides the Church into truth, fills and empowers believers
            through spiritual fruit and gifts given to the Church, and gives understanding of the
            Scripture which He inspired. (
          """,
          ref: "2 Peter 1:21",
          ref: "John 14:26",
          ref: "15:26",
          ref: "16:7-15",
          text: ")"
        ]
      },
      question84: %{
        title: "How does the Holy Spirit relate to you?",
        paragraph: [
          text: """
            Jesus Christ sends the Holy Spirit to make Jesus known to me, to indwell and empower me
            in Christ, to bear witness that I am a child of God, to guide me into all truth, and to stir my
            heart continually to worship and to pray. (
          """,
          ref: "John 16:12-15",
          ref: "Romans 8:15, 26",
          ref: "Ephesians 1:17-19",
          text: ")"
        ]
      },
      question85: %{
        title: "How do you receive the Holy Spirit?",
        paragraph: [
          text: """
            The Scriptures teach that, through repenting and being baptized in the name of Jesus Christ,
            I am forgiven my sins, indwelled from then on by the Holy Spirit, given new life in Christ by
            the Spirit, and freed from the power of sin so that I can be filled with the Holy Spirit. (
          """,
          ref: "John 3:1-7",
          ref: "Acts 2:38",
          ref: "Romans 6:14",
          ref: "Ephesians 5:18",
          text: ")"
        ]
      },
      question86: %{
        title: "What is the fruit of the Holy Spirit?",
        paragraph: [
          text: """
            The fruit of the Holy Spirit is the very character of Jesus developing in us through the work
            of the Holy Spirit: “love, joy, peace, patience, kindness, goodness, faithfulness, gentleness,
            self-control” (
          """,
          ref: "Galatians 5:22-23",
          text: ")"
        ]
      },
      question87: %{
        title: "What are the gifts of the Holy Spirit?",
        paragraph: [
          text: """
            The manifold gifts of the Holy Spirit include faith, healing, miracles, prophecy, discernment
            of spirits, other languages, the interpretation of other languages, administration, service,
            encouragement, giving, leadership, mercy and others. The Spirit gives these to individuals as
            he wills. (
          """,
          ref: "Romans 12:6-8, 1 Corinthians 12:7-11",
          ref: "27-31",
          ref: "Ephesians 4:7-10",
          text: ")"
        ]
      },
      question88: %{
        title: "Why does the Holy Spirit give these gifts?",
        paragraph: [
          text: """
            The Holy Spirit equips and empowers each believer for service in the worship of Jesus
            Christ, for the building up of his Church, and for witness and mission to the world.
            (
          """,
          ref: "Ephesians 4:12-16",
          text: ")"
        ]
      },
      question89: %{
        title: "What is the Church?",
        paragraph: [
          text: """
            The Church is the whole community of faithful Christians in heaven and on earth. The
            Church on earth gathers in local congregations to worship in Word and Sacrament, to serve
            God according to the Scriptures, and to proclaim the Gospel, under the leadership of those
            whom God appoints for this purpose. (
          """,
          articles_of_religion: 19,
          ref: "Matthew 28:19-20",
          ref: "1 Peter 2:9",
          text: ")"
        ]
      },
      question90: %{
        title: "How does the New Testament teach you to view the Church?",
        paragraph: [
          text: """
            The New Testament teaches me to view the Church as God’s covenant people and family, as
            the body and bride of Christ, and as the temple where God in Christ dwells by his Spirit.
            (
          """,
          ref: "John 1:12",
          ref: "1 Peter 2:9-10",
          ref: "1 Corinthians 3:16-17",
          ref: "2 Corinthians 6:16b-7:1",
          ref: "Revelation 19:6-10",
          ref: "21:9-10",
          text: ")"
        ]
      },
      question91: %{
        title: "Why is the Church called the Body of Christ?",
        paragraph: [
          text: """
            The Church is called the Body of Christ because all who belong to the Church are united to
            Christ as their Head and source of life, and are united to one another in Christ for mutual
            love and service to him. (
          """,
          ref: "1 Corinthians 12: 12-27",
          text: ")"
        ]
      },
      question92: %{
        title: "What are the “marks” or characteristics of the Church?",
        paragraph: [
          text: """
            The Nicene Creed expands on the Apostles’ Creed to list four characteristics of the Church:
            it is “one, holy, catholic and apostolic” (
          """,
          articles_of_religion: 8,
          text: ")"
        ]
      },
      question93: %{
        title: "In what sense is the Church “one?”",
        paragraph: [
          text: """
            The Church is one because all its members form the one Body of Christ, having “one Lord,
            one faith, one baptism, one God and Father of all.” The Church is called to express this
            unity in all relationships between believers. (
          """,
          ref: "Ephesians 4:5-6",
          text: ")"
        ]
      },
      question94: %{
        title: "Why is the Church called “holy?”",
        paragraph: [
          text: """
            The Church is holy because the Holy Spirit dwells in it and sanctifies its members, setting
            them apart to God in Christ, and calling them to moral and spiritual holiness of life.
          """
        ]
      },
      question95: %{
        title: "Why is the Church called “catholic?”",
        paragraph: [
          text: """
            The term “catholic” means “according to the whole.” The Church is called “catholic”
            because it holds the whole faith once for all delivered to the saints, and maintains continuity
            with the apostolic Church throughout time and space.
          """
        ]
      },
      question96: %{
        title: "Why is the Church called “apostolic”?",
        paragraph: [
          text: """
            An apostle is one who is sent. The Church is called apostolic because we hold the faith of
            Christ’s first Apostles;
            ref: "because we are in continuity with them",
            ref: "and because we, like them",
            are sent by Christ to proclaim the Gospel and to make disciples throughout the whole world.
            (
          """,
          ref: "Matthew 28:18-20",
          ref: "Luke 9:1-6",
          text: ")"
        ]
      },
      question97: %{
        title: "Who are the saints?",
        paragraph: [
          text: """
            The saints are all those in heaven and on earth who have faith in Christ, are set apart to God
            in Christ, are made holy by his grace, and live faithfully in him and for him. (
          """,
          ref: "Ephesians 1:1",
          ref: "Revelation 7:9-15",
          text: ")"
        ]
      },
      question98: %{
        title: "What does the word “communion” mean?",
        paragraph: [
          text: """
            The word “communion” means being “one with” someone else in union and unity.
            Christians use it to refer to the relationship of the three Persons within the one being of
            God, to our union with all three Persons through our union with Christ, and to our
            relationship with one another in Christ. (
          """,
          ref: "John 17:20-21",
          text: ")"
        ]
      },
      question99: %{
        title: "What is the “communion of the saints?”",
        paragraph: [
          text: """
            The communion of the saints is the unity and fellowship of all those united in one Body and
            one Spirit in Holy Baptism, both those on earth and those in heaven. (
          """,
          ref: "Ephesians 4:4-5",
          ref: "Hebrews 12:1",
          text: ")"
        ]
      },
      question100: %{
        title: "How is the communion of the saints practiced?",
        paragraph: [
          text: """
            It is practiced by mutual love, care and service, and by worshiping together where the word
            of the Gospel is preached and the sacraments of the Gospel are administered.
          """
        ]
      },
      question101: %{
        title: "How are the Church on earth and the Church in Heaven joined?",
        paragraph: [
          text: """
            All the worship of the Church on earth is a participating in the eternal worship of the
            Church in heaven. (
          """,
          ref: "Hebrews 12:22-24",
          text: ")"
        ]
      },
      question102: %{
        title: "What is a sacrament?",
        paragraph: [
          text: """
            A sacrament is an outward and visible sign of an inward and spiritual grace. God gives us the
            sign as a means whereby we receive that grace, and as a tangible assurance that we do in fact
            receive it. (1662 Catechism)
          """
        ]
      },
      question103: %{
        title: "How should you receive the sacraments?",
        paragraph: [
          text: """
            I should receive the sacraments by faith in Christ, with repentance and thanksgiving. Faith in
            Christ is necessary to receive grace, and obedience to Christ is necessary for the benefits of
            the sacraments to bear fruit in my life. (1662 Catechism;
          """,
          articles_of_religion: 28,
          text: ")"
        ]
      },
      question104: %{
        title: "What are the sacraments of the Gospel?",
        paragraph: [
          text: """
            The two sacraments ordained by Christ, which are generally necessary for our salvation, are
            Baptism and Holy Communion, which is also known as the Lord’s Supper or the Holy
            Eucharist. (
          """,
          articles_of_religion: 25,
          text: ")"
        ]
      },
      question105: %{
        title: "What is the outward and visible sign in Baptism?",
        paragraph: [
          text: """
            The outward and visible sign is water, in which candidates are baptized “In the name of the
            Father, and of the Son, and of the Holy Spirit” – the name of the Triune God to whom the
            candidate is being committed. (1662 Catechism, 
          """,
          ref: "1 Peter 3:21",
          ref: "Matthew 28:19",
          text: ")"
        ]
      },
      question106: %{
        title: "What is the inward and spiritual grace set forth in Baptism?",
        paragraph: [
          text: """
            The inward and spiritual grace set forth is a death to sin and a new birth to righteousness,
            through union with Christ in his death and resurrection. I am born a sinner by nature,
            separated from God, but in baptism, rightly received, I am made God’s child by grace
            through faith in Christ. (
          """,
          ref: "John 3:3-5",
          ref: "Romans 6:1-11",
          ref: "Ephesians 2:12",
          ref: "Galatians 3:27-29",
          text: ")"
        ]
      },
      question107: %{
        title: "What is required of you when you come to be baptized?",
        paragraph: [
          text: """
            Repentance, in which I turn away from sin;
            ref: "and faith, in which I turn to Jesus Christ as m",
            Savior and Lord and embrace the promises that God makes to me in this sacrament. (
          """,
          ref: "Acts 2:38",
          text: ")"
        ]
      },
      question108: %{
        title: "Why is it appropriate to baptize infants?",
        paragraph: [
          text: """
            Because it is a sign of God’s promise that they are embraced in the covenant community of
            Christ’s Church. Those who in faith and repentance present infants to be baptized vow to
            raise them in the knowledge and fear of the Lord, with the expectation that they will one day
            profess full Christian faith as their own. (
          """,
          ref: "Acts 2:39",
          text: ")"
        ]
      },
      question109: %{
        title:
          "What signs of the Holy Spirit’s work do you hope and pray to see as a result of your",
        paragraph: [
          text: """
            baptism?
            I hope and pray that the Holy Spirit who indwells me will help me to be an active member of
            my Christian community, participate in worship, continually repent and return to God,
            proclaim the faith, love and serve my neighbor, and strive for justice and peace. (
          """,
          ref: "Hebrews 10:25",
          ref: "12:14",
          ref: "1 Peter 3:15",
          ref: "1 John 1:9",
          ref: "2:1",
          text: ")"
        ]
      },
      question110: %{
        title: "Why did Christ institute the sacrament of Holy Communion?",
        paragraph: [
          text: """
            He instituted it for the continued remembrance of the sacrifice of his atoning death, and to
            convey the benefits the faithful receive through that sacrifice. (
          """,
          ref: "Luke 22:17-20",
          ref: "1 Corinthians 10:16-17",
          text: ")"
        ]
      },
      question111: %{
        title: "What is the outward and visible sign in Holy Communion?",
        paragraph: [
          text: """
            The visible sign is bread and wine, which Christ commands us to receive. (
          """,
          ref: "1 Corinthians 11:23",
          text: ")"
        ]
      },
      question112: %{
        title: "What is the inward and spiritual thing signified?",
        paragraph: [
          text: """
            The spiritual thing signified is the body and blood of Christ, which are truly taken and
            received in the Lord’s Supper by faith. (
          """,
          ref: "1 Corinthians 10:16-18",
          ref: "11:27",
          ref: "John 6:52-56",
          text: ")"
        ]
      },
      question113: %{
        title: "What benefits do you receive through partaking of this sacrament?",
        paragraph: [
          text: """
            As my body is nourished by the bread and wine, I receive the strengthening and refreshing
            of my soul by the body and blood of Christ;
            ref: "and I receive the strengthening and refreshin",
            of the love and unity I share with fellow Christians, with whom I am united in the one Body
            of Christ. (1662 Catechism)
          """
        ]
      },
      question114: %{
        title: "What is required of you when you come to receive Holy Communion?",
        paragraph: [
          text: """
            I am to examine myself as to whether I truly repent of my sins and intend to lead the new
            life in Christ;
            ref: "whether I have a living faith in God’s mercy through Christ and remember hi",
            atoning death with a thankful heart;
            ref: "and whether I have shown love and forgiveness to al",
            people. (
          """,
          ref: "1 Corinthians 11:27-32",
          text: ")"
        ]
      },
      question115: %{
        title: "What is expected of you when you have shared in Holy Communion?",
        paragraph: [
          text: """
            Having been renewed in my union with Christ and his people through sharing in the Supper,
            I should continue to live in holiness, avoiding sin, showing love and forgiveness to all, and
            serving others in gratitude.
          """
        ]
      },
      question116: %{
        title: "Are there other sacraments?",
        paragraph: [
          text: """
            Other rites and institutions commonly called sacraments include confirmation, absolution,
            ordination, marriage, and anointing of the sick. These are sometimes called the sacraments
            of the Church.
          """
        ]
      },
      question117: %{
        title: "How do these differ from the sacraments of the Gospel?",
        paragraph: [
          text: """
            They are not commanded by Christ as necessary for salvation, but arise from the practice of
            the apostles and the early Church, or are states of life blessed by God from creation. God
            clearly uses them as means of grace.
          """
        ]
      },
      question118: %{
        title: "What is confirmation?",
        paragraph: [
          text: """
            After making a mature commitment to my baptismal covenant with God, I receive the laying
            on of the bishop’s hands with prayer. (
          """,
          ref: "Acts 8:14-17",
          ref: "Acts 19:6",
          text: ")"
        ]
      },
      question119: %{
        title: "What grace does God give you in confirmation?",
        paragraph: [
          text: """
            In confirmation, God strengthens the work of the Holy Spirit in me for his daily increase in
            my Christian life and ministry. (
          """,
          ref: "Acts 8:14-17",
          ref: "19:6",
          text: ")"
        ]
      },
      question120: %{
        title: "What is absolution?",
        paragraph: [
          text: """
            After repenting and confessing my sins to God in the presence of a priest, the priest declares
            God’s forgiveness to me with authority given by God. (
          """,
          ref: "John 20:22-23",
          ref: "James 5:15-16",
          text: ")"
        ]
      },
      question121: %{
        title: "What grace does God give to you in absolution?",
        paragraph: [
          text: """
            In absolution, God conveys to me his pardon through the cross, thus declaring to me
            reconciliation and peace with him, and bestowing upon me the assurance of his grace and
            salvation.
          """
        ]
      },
      question122: %{
        title: "What is ordination?",
        paragraph: [
          text: """
            Through prayer and the laying on of the bishop’s hands, ordination consecrates, authorizes,
            and empowers persons called to serve Christ and his Church in the ministry of Word and
            Sacrament. (
          """,
          ref: "1 Timothy 1:5",
          ref: "1 Timothy 5:22",
          ref: "Acts 6:6",
          text: ")"
        ]
      },
      question123: %{
        title: "What grace does God give in ordination?",
        paragraph: [
          text: """
            In ordination, God confirms the gifts and calling of the candidates, conveys the gift of the
            Holy Spirit for the office and work of bishop, priest or deacon, and sets them apart to act on
            behalf of the Church and in the name of Christ.
          """
        ]
      },
      question124: %{
        title: "What are the three ordained ministries in the Anglican Church?",
        paragraph: [
          text: "The three orders are bishops, priests, and deacons."
        ]
      },
      question125: %{
        title: "What is the work of bishops?",
        paragraph: [
          text: """
            The work of bishops is to represent and serve Christ and the Church as chief pastors, to lead
            in preaching and teaching the faith and in shepherding the faithful, to guard the faith, unity,
            and discipline of the Church, and to bless, confirm and ordain, thus following in the
            tradition of the Apostles. (
          """,
          ref: "Titus 1:7-9",
          ref: "1 Timothy 3:1-7",
          ref: "Acts 20:28",
          text: ")"
        ]
      },
      question126: %{
        title: "What is the work of priests?",
        paragraph: [
          text: """
            The work of priests, serving Christ under their bishops, is to nurture congregations through
            the full ministry of the Word preached and Sacraments rightly administered, and to
            pronounce absolution and blessing in God’s name. (
          """,
          ref: "Titus 1:5",
          ref: "1 Peter 5:1",
          text: ")"
        ]
      },
      question127: %{
        title: "What is the work of deacons?",
        paragraph: [
          text: """
            The work of deacons, serving Christ under their bishops, is to assist priests in public
            worship, instruct both young and old in the catechism, and care for those in need. (
          """,
          ref: "Acts 6:1-6",
          ref: "1 Timothy 3:8-13",
          text: ")"
        ]
      },
      question128: %{
        title: "What is marriage?",
        paragraph: [
          text: """
            Marriage is a lifelong covenant between a man and a woman, binding both to self-giving love
            and exclusive fidelity. In the rite of Christian marriage, the couple exchange vows to uphold
            this covenant. They do this before God and in the presence of witnesses, who pray that God
            will bless their life together. (
          """,
          ref: "Genesis 2:23-24",
          ref: "Matthew 19",
          ref: "Mark 10:2-9",
          ref: "Romans 7:2-3",
          ref: "1 Corinthians 7:39",
          text: ")"
        ]
      },
      question129: %{
        title: "What is signified in marriage?",
        paragraph: [
          text: """
            The covenantal union of man and woman in marriage signifies the communion between
            Christ, the heavenly bridegroom, and the Church, his holy bride. Not all are called to
            marriage, but all Christians are wedded to Christ and blessed by the grace God gives in
            marriage. (
          """,
          ref: "Ephesians 5:31-32",
          text: ")"
        ]
      },
      question130: %{
        title: "What grace does God give in marriage?",
        paragraph: [
          text: """
            In Christian marriage, God establishes and blesses the covenant between husband and wife,
            and joins them to live together in a communion of love, faithfulness and peace within the
            fellowship of Christ and his Church. God enables all married people to grow in love,
            wisdom and godliness through a common life patterned on the sacrificial love of Christ.
          """
        ]
      },
      question131: %{
        title: "What is the anointing of the sick?",
        paragraph: [
          text: """
            Through prayer and anointing with oil, the minister invokes God’s blessing upon those
            suffering in body, mind, or spirit. (
          """,
          ref: "Matthew 10:8",
          ref: "James 5:14-16",
          text: ")"
        ]
      },
      question132: %{
        title: "What grace does God give in the anointing of the sick?",
        paragraph: [
          text: """
            As God wills, the healing given through anointing may bring bodily recovery from illness,
            peace of mind or spirit, and strength to persevere in adversity, especially in preparation for
            death.
          """
        ]
      },
      question133: %{
        title: "What are sins?",
        paragraph: [
          text: """
            A sin is any desire or disobedient act that arises out of the fallen condition of my human
            nature and falls short, either by commission or omission, of perfect conformity to God’s
            revealed will. (
          """,
          ref: "1 John 3:4",
          text: ")"
        ]
      },
      question134: %{
        title: "How does God respond to human sin?",
        paragraph: [
          text: """
            All sin is opposed to the holiness of God, and is therefore subject to God’s condemnation
            But God in his mercy offers forgiveness and salvation from sin to all people through the
            reconciling life, death and resurrection of his Son Jesus Christ. (
          """,
          ref: "Matthew 26:28",
          ref: "Romans 1:18-2:4",
          ref: "6:6-11",
          text: ")"
        ]
      },
      question135: %{
        title: "How does God forgive your sins?",
        paragraph: [
          text: """
            By virtue of Christ’s atoning sacrifice, God sets aside my sins, accepts me, and adopts me as
            his child and heir in Jesus Christ. Loving me as his child, he forgives my sins whenever I turn
            to him in repentance and faith. (
          """,
          ref: "2 Corinthians 5:16-18",
          text: ")"
        ]
      },
      question136: %{
        title: "How should you respond to God’s forgiveness?",
        paragraph: [
          text: """
            As I live in the grace of God’s constant forgiveness, so I should live in constant thanks and
            praise to him;
            ref: "and as I have been loved and forgiven, so I should love and forgive withou",
            limit those who sin against me. (
          """,
          ref: "Matthew 6:12",
          ref: "18:22",
          text: ")"
        ]
      },
      question137: %{
        title: "What is grace?",
        paragraph: [
          text: """
            Grace is the gift of the triune God’s love, mercy, and help, which he freely gives to us who,
            because of our sin, deserve only condemnation. (
          """,
          ref: "Acts 20:32",
          ref: "Romans 3:24",
          ref: "2 Corinthians 8:9",
          ref: "Ephesians 1:6-7",
          text: ")"
        ]
      },
      question138: %{
        title: "Does God give his grace only to Christians?",
        paragraph: [
          text: """
            No. God graciously provides for all people;
            ref: "“he makes his sun rise on the evil and on th",
            good, and sends rain on the just and on the unjust” (
          """,
          ref: "Matthew 5:45",
          text:
            "). However, he shows his saving grace by bringing to faith in Christ those who are far from him. (",
          ref: "Romans 5:1-11",
          text: ")"
        ]
      },
      question139: %{
        title: "For what purpose does God give you grace?",
        paragraph: [
          text: """
            God gives me grace in Christ for the forgiveness of my sins, the healing of sin’s effects,
            growth in holiness, preservation through death and judgment, and my ultimate
            transformation into the image of Christ. (
          """,
          ref: "2 Corinthians 3:16-18",
          ref: "Ephesians 2:2-10",
          text: ")"
        ]
      },
      question140: %{
        title: "Is God’s grace only for your religious or spiritual life?",
        paragraph: [
          text: """
            No. God cares about my whole life, and his grace in Christ is at work in every aspect of it. (
          """,
          ref: "1 Corinthians 10:13",
          ref: "Romans 8:28",
          text: ")"
        ]
      },
      question141: %{
        title: "Can you earn God’s grace?",
        paragraph: [
          text: """
            No. God gives his grace freely, and enables me to receive it. Everything I do should be in
            response to God’s love and grace made known in Christ, for “while we were still sinners,
            Christ died for us” (
          """,
          ref: "Romans 5:8",
          text: "), and “we love because he first loved us” (",
          ref: "1 John 4:19",
          text: ")"
        ]
      },
      question142: %{
        title: "How should you think of the human body?",
        paragraph: [
          text: """
            My body is the good and God-given means of my experience, expression, enjoyment, love
            and service within God’s good creation. But sin and death now infect this world, and my
            body will degenerate and die. (
          """,
          ref: "Genesis 1:26-31",
          ref: "Genesis 3:19",
          text: ")"
        ]
      },
      question143: %{
        title: "Where do you go after you die?",
        paragraph: [
          text: """
            When I die, my body will perish but, by the will of God, my soul will live on, awaiting
            resurrection and final judgment. (
          """,
          ref: "1 Corinthians 15:42-44",
          text: ")"
        ]
      },
      question144: %{
        title: "What is the resurrection of the body?",
        paragraph: [
          text: """
            When Jesus appears on judgment day, he will bring all the dead back to bodily life, the
            wicked to judgment and the righteous to eternal life in the glory of God. (
          """,
          ref: "John 5:25-29",
          ref: "1 Thessalonians 4:13-17",
          text: ")"
        ]
      },
      question145: %{
        title: "What do you know about the resurrected bodies of believers?",
        paragraph: [
          text: """
            I know that they will match, express and serve our redeemed humanity, and be fully renewed
            in the image of Christ, being fully glorified in him. (
          """,
          ref: "2 Peter 1:4",
          text: ")"
        ]
      },
      question146: %{
        title: "How does the promise of bodily resurrection affect the way you live today?",
        paragraph: [
          text: """
            Because my body was created good by God and is redeemed by him, I should honor it. I
            should refrain from any violence, disrespect or sin that would harm, demean or violate either
            my body or the bodies of others. (
          """,
          ref: "Romans 12",
          text: ")"
        ]
      },
      question147: %{
        title: "What do you know about the unending life of believers, following judgment day?",
        paragraph: [
          text: """
            I know that it will be a life of joyful fellowship with our triune God and with resurrected
            believers, as we praise and serve God together in the new heaven and the new earth.
            (
          """,
          ref: "Revelation 21:1-4",
          text: ")"
        ]
      },
      question148: %{
        title: "How should you live in light of this promise of unending life?",
        paragraph: [
          text: """
            I should live in joyful expectation of the fullness of my transformation, soul and body, into
            the likeness of Christ, as a part of the renewal of the whole creation. In the midst of life’s
            difficulty and suffering, and in the face of hostility and persecution for my faith, I am
            sustained by this hope and the knowledge of our triune God’s eternal love for me.
          """
        ]
      },
      question149: %{
        title: "What is prayer?",
        paragraph: [
          text: "Prayer is turning my heart toward God, to converse with him in worship. (",
          ref: "Psalm 122, 123",
          text: ")"
        ]
      },
      question150: %{
        title: "What should you seek in prayer?",
        paragraph: [
          text: """
            In prayer I should seek the joy of fellowship with God, who made me for fellowship with
            him. (
          """,
          ref: "1 Chronicles 16:28-30",
          ref: "Psalm 96",
          ref: "John 17",
          ref: "Revelation 22:17",
          text: ")"
        ]
      },
      question151: %{
        title: "What is fellowship with God?",
        paragraph: [
          text: """
            Fellowship with God in prayer is relating to him as his children, as we approach the light and
            glory of his throne. (
          """,
          ref: "Revelation 7:9-17",
          text: ")"
        ]
      },
      question152: %{
        title: "How can you have fellowship with God?",
        paragraph: [
          text: """
            Through the death of Jesus as both High Priest and sacrifice, and in his Holy Spirit, I have
            fellowship with God in Word, Sacrament, and prayer. (
          """,
          ref: "Hebrews 4:16",
          ref: "1 John 1:1-4",
          text: ")"
        ]
      },
      question153: %{
        title: "Why should you pray?",
        paragraph: [
          text: """
            I should pray, first, because God calls me so to do;
            second, because I desire to know God
            and be known by him;
            third, because I need the grace and consolation of the Holy Spirit;
            and fourth, because God responds to the prayers of his people. (
          """,
          ref: "Luke 11:13",
          text: ")"
        ]
      },
      question154: %{
        title: "What should you pray?",
        paragraph: [
          text: """
            In addition to my own prayers, I should pray the Lord’s Prayer, the Psalms, and the collected
            prayers of the Church.
          """
        ]
      },
      question155: %{
        title: "When should you pray?",
        paragraph: [
          text: """
            I should pray morning, noon, and night, and whenever I am aware of my need for God’s
            special grace. And I should learn “to pray without ceasing” as I grow in knowledge of God’s
            nearness. (
          """,
          ref: "Psalm 55:17",
          ref: "Daniel 6:10-13",
          ref: "Matthew 15:21-28",
          ref: "1 Thessalonians 5:16-18",
          ref: "Hebrews 4:16",
          text: ")"
        ]
      },
      question156: %{
        title: "What is the prayer our Lord taught his disciples to pray?",
        paragraph: [
          text: """
            The traditional version of the Lord’s Prayer is:
            Our Father, Who art in heaven, hallowed be thy Name. Thy Kingdom come,
            Thy will be done, on earth as it is in heaven. Give us this day our daily bread, and
            forgive us our trespasses, as we forgive those who trespass against us. And lead
            us not into temptation, but deliver us from evil. For thine is the kingdom, and 
            the power, and the glory, for ever and ever. Amen.
          """
        ]
      },
      question157: %{
        title: "Why should you pray the Lord’s Prayer?",
        paragraph: [
          text: """
            I should pray the Lord’s Prayer because Christ in the gospels teaches it to his disciples, as
            both a practice and a pattern for fellowship with God the Father. (
          """,
          ref: "Matthew 6:9-13",
          ref: "Luke 11:2-4",
          text: ")"
        ]
      },
      question158: %{
        title: "How is the Lord’s Prayer a practice for all prayer?",
        paragraph: [
          text: """
            When I pray the Lord’s Prayer, Jesus is training me to pray according to his Father’s will;
            so I should employ the prayer constantly. (
          """,
          ref: "1 John 5:14-15",
          ref: "Luke 11:2",
          text: ")"
        ]
      },
      question159: %{
        title: "How does the Lord’s Prayer give you a pattern for prayer?",
        paragraph: [
          text: """
            The Lord’s Prayer models the primary elements of fellowship with God: praise of God,
            acceptance of his rule and will, petition for his provision, confession of my sins (
            here called trespasses), forgiveness of others, avoidance of sin, and God’s protection from evil and
            Satan. I should pray regularly about these things in my own words. (
          """,
          ref: "Matthew 6:9",
          text: ")"
        ]
      },
      question160: %{
        title: "What are the parts of the Lord’s Prayer?",
        paragraph: [
          text: """
            The Lord’s Prayer begins with an address, makes seven petitions, adds a doxology, and
            concludes with “Amen.”
          """
        ]
      },
      question161: %{
        title: "Describe the order of the petitions in the Lord’s Prayer.",
        paragraph: [
          text: """
            As in the Ten Commandments, God’s Glory, Name, and Kingdom precede any petitions for
            our personal well-being.
          """
        ]
      },
      question162: %{
        title: "How do you address God in this prayer?",
        paragraph: [
          text:
            "As Jesus taught his disciples to call upon God, I pray, “Our Father, Who art in heaven.”"
        ]
      },
      question163: %{
        title: "Who may call God Father?",
        paragraph: [
          text: """
            All who are adopted as God’s children through faith and baptism in Christ may call him
            Father. (
          """,
          ref: "John 1:12-13",
          text: ")"
        ]
      },
      question164: %{
        title: "If prayer is personal, why do you not say “my” Father?",
        paragraph: [
          text: """
            The Lord Jesus teaches God’s children always to think of themselves as living members of
            his Body, God’s family of believers, and to pray accordingly.
          """
        ]
      },
      question165: %{
        title: "How is God like earthly fathers?",
        paragraph: [
          text: """
            Like all loving and sincere earthly fathers, God loves, teaches, and disciplines us, observing
            our needs and frailties, and planning for our maturity, security, and well-being. (
          """,
          ref: "Psalm 103:12-14"
        ]
      },
      question166: %{
        title: "How is God unlike earthly fathers?",
        paragraph: [
          text: """
            Unlike our natural fathers, our heavenly Father is perfect in his love, almighty in his care,
            makes no errors in judgment, and disciplines us only for our good. (
          """,
          ref: "Hebrews 12:4-11",
          text: ")"
        ]
      },
      question167: %{
        title: "What is heaven?",
        paragraph: [
          text: """
            Heaven is the realm of God’s glory, presence, and power, which exists alongside this earthly
            realm, and from which he hears the prayers of his children. (
          """,
          ref: "1 Kings 8",
          ref: "Isaiah 61-6;     ",
          ref: "Revelation 21:1-5a",
          text: ")"
        ]
      },
      question168: %{
        title: "If your Father is in heaven, can he help you on earth?",
        paragraph: [
          text: """
            Yes. God is everywhere, and as my almighty Father in heaven, he is able and willing to
            answer my prayers. (
          """,
          ref: "Psalm 99",
          ref: "Isaiah 6",
          ref: "Ephesians 3:20, 4:6",
          text: ")"
        ]
      },
      question169: %{
        title: "What is the First Petition?",
        paragraph: [
          text: "The First Petition is: “Hallowed be Thy Name.”"
        ]
      },
      question170: %{
        title: "What is God’s Name?",
        paragraph: [
          text: """
            God’s Name refers to his personal being – his nature, his character, his power, and his
            purposes. The Name God reveals to Moses is “I AM WHO I AM” or simply “I AM”
            (
          """,
          ref: "Exodus 3:6, 14",
          text: """
            ). This Name means that he alone is truly God, he is the source of his own
            being, he is holy and just, and he cannot be measured or defined by his creatures.
          """
        ]
      },
      question171: %{
        title: "Does God have other names?",
        paragraph: [
          text: """
            Yes. Through the person and ministry of Jesus Christ, God’s Name is also revealed to be
            “the Father, the Son and the Holy Spirit” (
          """,
          ref: "Matthew 28:19",
          text: ")"
        ]
      },
      question172: %{
        title: "What does “hallowed” mean?",
        paragraph: [
          text: """
            Hallowed means to be treated as holy, set apart, and sacred. To hallow God’s name is to
            honor him as holy.
          """
        ]
      },
      question173: %{
        title: "How can you hallow God’s name?",
        paragraph: [
          text: """
            God is King of all the earth, and I pray that all people everywhere may revere and worship
            him, according to his revelation in Christ and the Holy Scriptures. (
          """,
          ref: "Psalm 2",
          ref: "Psalm 24",
          ref: "Psalm 47",
          ref: "Psalm 96",
          ref: "Psalm 99",
          ref: "Isaiah 40:12-20",
          ref: "John 14:8-9",
          ref: "Acts 4:8-12",
          ref: "2 Corinthians 4:6",
          ref: "Revelation 1",
          ref: "Revelation: 21:9-end",
          text: ")"
        ]
      },
      question174: %{
        title: "How does God answer this petition?",
        paragraph: [
          text: """
            God gives grace that I may honor his holy Name and Word in private and public worship, 
            and he enables me to walk humbly with him, my God. (
          """,
          ref: "Micah 6:8",
          ref: "Matthew 28:18-20",
          text: ")"
        ]
      },
      question175: %{
        title: "How else can you hallow God’s Name?",
        paragraph: [
          text: """
            I can hallow God’s Name in word and deed by living an obedient and ordered life as his
            child, as a citizen of his Kingdom, and as one who seeks his glory. (
          """,
          ref: "Hebrews 13:15-16",
          text: ")"
        ]
      },
      question176: %{
        title: "What is the Second Petition?",
        paragraph: [
          text: "The Second Petition is: “Thy Kingdom come.”"
        ]
      },
      question177: %{
        title: "What is the Kingdom?",
        paragraph: [
          text: """
            The Kingdom of God is his reign over all the world and in the hearts of his people through
            the powerful and effective operation of his Holy Spirit. (
          """,
          ref: "Matthew 12:28",
          ref: "Romans 8:12-17",
          ref: "Galatians 4:6-7",
          text: ")"
        ]
      },
      question178: %{
        title: "When you pray for God’s Kingdom to come, what do you desire?",
        paragraph: [
          text:
            "I pray that the whole creation may enjoy full restoration to its rightful Lord. (",
          ref: "Romans 8:22-25",
          ref: "Philippians 2:9-11",
          text: ")"
        ]
      },
      question179: %{
        title: "How does God’s Kingdom come?",
        paragraph: [
          text: """
            God’s Kingdom, which was foreshadowed in the Old Testament, was founded in Christ’s
            incarnation, established with his ascension, advances with the fulfilling of the Great
            Commission, and will be completed when Christ delivers it to God the Father at the end of
            time. (
          """,
          ref: "2 Chronicles 7:1-4",
          ref: "Matthew 10:5-8",
          ref: "28:18-20",
          ref: "Luke 24:1-12",
          ref: "Acts 1:6-11",
          ref: "1 Corinthians 15:19-28",
          text: ")"
        ]
      },
      question180: %{
        title: "How do you live in God’s Kingdom?",
        paragraph: [
          text: """
            My Kingdom life as a Christian consists of living with joy, hope, and peace as a child of
            God, a citizen of heaven, and a faithful disciple of Jesus Christ. (
          """,
          ref: "Romans 14:17",
          ref: "Ephesians 4-6",
          ref: "Colossians 1:13-14",
          ref: "3:4",
          ref: "1 Thessalonians 4:11",
          text: ")"
        ]
      },
      question181: %{
        title: "What is the Third Petition?",
        paragraph: [
          text: "The Third Petition is: “Thy will be done on earth as it is in heaven.”"
        ]
      },
      question182: %{
        title: "How is God’s will accomplished in heaven?",
        paragraph: [
          text: """
            The heavenly company of angels and perfected believers responds to God in perfect, willing
            obedience, and perfect worship. (
          """,
          ref: "Psalm 103:20",
          ref: "Psalm 104:4",
          ref: "Psalm 148:2",
          text: ")"
        ]
      },
      question183: %{
        title: "Where can you find God’s will?",
        paragraph: [
          text: """
            I find the will of God outlined in the Ten Commandments, learn its fullness from the whole
            of Scripture, and see it culminate in the Law of Christ, which calls for my complete love of
            God and my neighbor. (
          """,
          ref: "Deuteronomy 29:29",
          ref: "Psalm 119:1-16, 104-105",
          ref: "Proverbs 4",
          ref: "John 13:34",
          ref: "Acts 7:51-53",
          ref: "Galatians 6:2",
          text: ")"
        ]
      },
      question184: %{
        title: "How is God’s will accomplished on earth?",
        paragraph: [
          text: """
            God’s Kingdom comes whenever and wherever God’s will is done. As the Church aims to
            hallow God’s Name and seek first his Kingdom, it should lead the way in wholehearted
            obedience to God in Christ, and I should join and support the Church in this. (
          """,
          ref: "Psalm 119:1-76",
          ref: "Matthew 5-7",
          ref: "Ephesians 1:11",
          ref: "Daily Office Prayer of St. John Chrysostom",
          text: ")"
        ]
      },
      question185: %{
        title: "What more do you seek in the third petition?",
        paragraph: [
          text: """
            In the third petition I also pray for God to counter the dominion of the world, the flesh, and
            the Devil in my own soul;
            ref: "to thwart the plans of wicked people",
            ref: "and to extend the Kingdo",
            of his grace to others through me. (
          """,
          ref: "Baptismal Service",
          ref: "Acts 1:8",
          ref: "1 John 2:15-17",
          ref: "Galatians 5:16-21",
          ref: "1 Thessalonians 4:3",
          ref: "1 Timothy 2:4",
          text: ")"
        ]
      },
      question186: %{
        title:
          "For what personal blessings does the second half of the Lord’s Prayer teach you to ask?",
        paragraph: [
          text: """
            As a loyal child of God I pray first for God’s honor, Kingdom, and will;
            then I pray for my
            own needs of daily bread, pardon for sins, and protection from evil.
          """
        ]
      },
      question187: %{
        title: "What is the Fourth Petition?",
        paragraph: [
          text: "The Fourth Petition is: “Give us this day our daily bread.”"
        ]
      },
      question188: %{
        title: "What does “our daily bread” mean?",
        paragraph: [
          text: """
            Daily bread includes all that is needed for personal well-being, such as food and clothing,
            homes and families, work and health, friends and neighbors, and peace and godly
            governance. (
          """,
          ref: "Matthew 6:8",
          ref: "Luke 11:12",
          ref: "1 Timothy 2:1-2",
          text: ")"
        ]
      },
      question189: %{
        title: "Why should you pray for bread daily?",
        paragraph: [
          text: "God wishes me to trust him every day to supply my needs for that day. (",
          ref: "Proverbs 30:7-9",
          ref: "Matthew 6:24-34",
          ref: "Philippians 4:6",
          text: ")"
        ]
      },
      question190: %{
        title: "Why does God give you daily bread?",
        paragraph: [
          text: """
            God gives me daily bread because he is a good and loving Father, and I should thank him 
            for it morning, noon, and night. (
          """,
          ref: "Psalm 81:10",
          ref: "Psalm 16",
          ref: "Psalm 103",
          ref: "Daniel 6:10",
          text: ")"
        ]
      },
      question191: %{
        title: "What is the Fifth Petition?",
        paragraph: [
          text: """
            The Fifth Petition is: “Forgive us our trespasses as we forgive those who trespass against
            us.”
          """
        ]
      },
      question192: %{
        title: "What are trespasses?",
        paragraph: [
          text: """
            A trespass is a thought, word, or deed contrary to God’s holy character and Law, missing the
            mark of his will and expectations. (
          """,
          ref: "Romans 3:23",
          text: ")"
        ]
      },
      question193: %{
        title: "Have you trespassed against God’s Law?",
        paragraph: [
          text: """
            Yes. Together with all mankind, I sin daily against God’s Law in thought, word, and deed,
            and love neither him nor my neighbor as I should. (
          """,
          ref: "Jeremiah 2:12-14",
          ref: "Romans 1:18-24",
          ref: "Romans 3:23",
          text: ")"
        ]
      },
      question194: %{
        title: "What is God’s forgiveness?",
        paragraph: [
          text: """
            God’s forgiveness is his merciful removal of the guilt of sin that results from our
            disobedience. (
          """,
          ref: "Isaiah 1:18",
          ref: "Isaih 52:13-53:12",
          ref: "Ephesians 1:3-14",
          ref: "Colossians 2:13-14",
          text: ")"
        ]
      },
      question195: %{
        title: "On what basis do you ask forgiveness?",
        paragraph: [
          text: """
            I ask God to forgive all my sins through the righteousness of Jesus Christ, which was
            completed for me on the cross and is given to me through faith and Baptism. (
          """,
          ref: "Acts 2:38",
          ref: "Romans 5:17",
          ref: "Colossians 2:9-12",
          ref: "1 John 1:9-10",
          text: ")"
        ]
      },
      question196: %{
        title: "Does God forgive your sins?",
        paragraph: [
          text: """
            Yes. God freely forgives the sins of all who ask him in true repentance and faith, and that
            includes me. (
          """,
          ref: "Leviticus 6:6-8",
          ref: "Matthew 11:28-30",
          ref: "John 6:37, 40, 51",
          ref: "John 7:37",
          ref: "2 Corinthians 5:17-21",
          ref: "Hebrews 7:25",
          text: ")"
        ]
      },
      question197: %{
        title: "Do you forgive others as fully as God forgives you?",
        paragraph: [
          text: """
            Following the example of my Lord Jesus, I seek constantly to forgive those who sin against
            me. (
          """,
          ref: "Matthew 18:21-35",
          ref: "Luke 23:34",
          ref: "Acts 7:60",
          ref: "Romans 5:8",
          ref: "2 Corinthians 5:18-19",
          text: ")"
        ]
      },
      question198: %{
        title: "Why should you forgive others?",
        paragraph: [
          text: "I should forgive others because while I was still a sinner God forgave me. (",
          ref: "Matthew 18:21-35",
          text: ")"
        ]
      },
      question199: %{
        title: "How will you forgive others?",
        paragraph: [
          text: """
            I will forgive others by extending to them the love of Christ, and by choosing not to hold
            against them the hurts they have inflicted, whether they ask forgiveness or not. (
          """,
          ref: "Romans 13:8",
          text: ")"
        ]
      },
      question200: %{
        title: "Will your forgiveness of others bring reconciliation with them?",
        paragraph: [
          text: """
            Not always. Forgiveness is an attitude of my heart desiring the blessing of my neighbor, but
            my forgiveness may not result in my neighbor’s repentance and the restoration of our
            relationship. (
          """,
          ref: "Romans 12:18",
          text: ")"
        ]
      },
      question201: %{
        title: "What is the Sixth Petition?",
        paragraph: [
          text: "The Sixth Petition is: “And lead us not into temptation.”"
        ]
      },
      question202: %{
        title: "What is temptation?",
        paragraph: [
          text:
            "Temptation is an enticement to abandon total trust in God or to violate his commandments. (",
          ref: "Proverbs 1:8-19",
          ref: "James 1:14-15",
          text: ")"
        ]
      },
      question203: %{
        title: "What are the sources of temptation?",
        paragraph: [
          text: """
            My heart is tempted by the world, the flesh, and the Devil, all of which are enemies of God
            and of my spiritual well-being. (
          """,
          ref: "1 John 2:15-17",
          ref: "Galatians 5:16-2",
          ref: "1 John 3:8",
          text: ")"
        ]
      },
      question204: %{
        title: "What kind of protection from temptation do you ask for?",
        paragraph: [
          text:
            "Knowing Satan’s hatred and my weakness, I ask God to keep me from sin and danger. (",
          ref: "Luke 22:31",
          ref: "James 1:14",
          ref: "1 Peter 5:8",
          text: ")"
        ]
      },
      question205: %{
        title: "Does God lead you into temptation?",
        paragraph: [
          text: """
            No. God never tempts anyone to sin, nor is he the cause of any sin, but, so that I may grow
            in obedience, he does allow me to be tested on occasion, as he allowed Jesus. (
          """,
          ref: "Matthew 4:1-14",
          ref: "Hebrews 5:7-8",
          ref: "Genesis 22",
          ref: "Judges 2",
          ref: "James 1:1-8",
          text: ")"
        ]
      },
      question206: %{
        title: "What are ways to guard against temptation?",
        paragraph: [
          text: """
            I can guard against temptation by praying the Lord’s Prayer, asking for strength, confessing
            my sins, recalling God’s Word, and living accountably with others. (
          """,
          ref: "Matthew 4:1-11",
          ref: "Mark 14:38",
          ref: "1 Corinthians 10:13",
          ref: "2 Corinthians 12:9-10",
          ref: "Ephesians 6:13-17",
          ref: "James 5:16",
          ref: "1 John 1:9",
          text: ")"
        ]
      },
      question207: %{
        title: "What is the Seventh Petition?",
        paragraph: [
          text: "The Seventh Petition is: “But deliver us from evil.”"
        ]
      },
      question208: %{
        title: "What is evil?",
        paragraph: [
          text: """
            Evil is the willful perversion of God’s good will that defies his holiness and mars his good 
            creation. (
          """,
          ref: "Genesis 3:1-19",
          ref: "Genesis 4:1-8",
          ref: "Genesis 6:1-8",
          text: ")"
        ]
      },
      question209: %{
        title: "If God made the world good at its creation, why does he permit evil?",
        paragraph: [
          text: """
            God made rational creatures free to worship, love, and obey him, but also free to reject his
            love, rebel against him, and choose evil – as the human race has done. (
          """,
          ref: "Genesis 6:5",
          ref: "Ecclesiastes 7:29",
          ref: "1 Timothy 1:20",
          ref: "Revelation 2:18-29",
          text: ")"
        ]
      },
      question210: %{
        title: "Did evil exist before the human race embraced it?",
        paragraph: [
          text:
            "Yes. Satan and the other demons with him had already opposed God and chosen evil. (",
          ref: "Genesis 3: 1-5",
          ref: "Job 1:6-12",
          ref: "John 8:44",
          text: ")"
        ]
      },
      question211: %{
        title: "What are Satan and demons?",
        paragraph: [
          text: """
            Demons, of whom Satan is chief, are fallen angels. Satan rebelled against God and led other
            angels to follow him. They now cause spiritual and sometimes physical harm to mortals, and
            they sow lies that lead to confusion, despair, sin and death. (
          """,
          ref: "Luke 11:14-26",
          ref: "8:29",
          ref: "9:39",
          ref: "John 8:44",
          ref: "2 Corinthians 2:11",
          ref: "2 Corinthians 4:3-",
          ref: "2 Corinthians 11:3",
          ref: "2 Corinthians 12:7",
          ref: "Revelation 12:7-12",
          text: ")"
        ]
      },
      question212: %{
        title: "How did Satan and his angels turn to evil?",
        paragraph: [
          text:
            "Satan and his angels were overcome by envy and pride and rebelled against God. (",
          ref: "Luke 10:18",
          ref: "1 Timothy 3:6",
          ref: "Jude 6",
          ref: "Revelation 12:7-12",
          text: ")"
        ]
      },
      question213: %{
        title: "What are angels?",
        paragraph: [
          text: """
            Angels are spiritual, holy beings created by God. They joyfully serve him in heavenly
            worship and God appoints them to act as messengers, bringing words of guidance and
            assurance to the faithful, and assisting and protecting them. (
          """,
          ref: "Psalm 148:1-6",
          ref: "Hebrews 1:14",
          ref: "Luke 1:19, 26-33",
          ref: "Acts 8:26-28",
          ref: "Acts 12:7-11",
          ref: "Acts 27:23-24",
          text: ")"
        ]
      },
      question214: %{
        title: "How did God address evil in this world?",
        paragraph: [
          text: """
            God, in his love, sent Jesus Christ to gain victory over all the powers of evil by his death,
            resurrection and ascension. Victory and authority over sin and evil are granted to the faithful
            in their daily lives through the Holy Spirit by the blood of Jesus shed on the cross. God will
            finally overcome all evil, including death, at the end of the age. (
          """,
          ref: "John 3:16",
          ref: "Colossians 2:13-15",
          ref: "Luke 10:17-20",
          ref: "Philippians 2:10",
          ref: "1 John 4:4",
          ref: "Romans 8:28, 35-39",
          ref: "Revelation 21:1-4",
          text: ")"
        ]
      },
      question215: %{
        title: "Is God responsible for evil?",
        paragraph: [
          text:
            "No. The free choices of his creatures do not implicate God in evil in any way. (",
          ref: "Galatians 2:17",
          ref: "James 1:13-15",
          text: ")"
        ]
      },
      question216: %{
        title: "How does God redeem evil?",
        paragraph: [
          text: """
            Though the evil deeds of his creatures may cause great harm and suffering, the almighty and 
            all-wise God can use them to bring about his good purposes, both in the world and in my
            life. (
          """,
          ref: "Genesis 50:20",
          ref: "Romans 8:28",
          text: ")"
        ]
      },
      question217: %{
        title: "From what evil do you seek to be delivered?",
        paragraph: [
          text: """
            I desire, first and foremost, to be delivered from Satan our Enemy, the Evil One, and all
            demonic forces that seek to destroy God’s creatures. (
          """,
          ref: "Matthew 16:21-23",
          ref: "John 13:27",
          ref: "1 Peter 5:8-9",
          text: ")"
        ]
      },
      question218: %{
        title: "From what other evil do you seek deliverance?",
        paragraph: [
          text: """
            I ask my heavenly Father to protect me from the world and the flesh, and to deliver me from
            the dangers of the day and night;
            from sin, sorrow, sickness, and horror;
            and from
            everlasting damnation. (The Great Litany, BCP 1662)
          """
        ]
      },
      question219: %{
        title: "How does God deliver you from evil?",
        paragraph: [
          text: """
            God’s Holy Spirit transforms my soul to see and hate evil as he does;
            ref: "then he further deliver",
            me either by removing my trial or by giving me strength to endure it gracefully. (
          """,
          ref: "Psalm 1",
          ref: "Psalm 23",
          ref: "1 Corinthians 10:13",
          ref: "2 Corinthians 12:9-10",
          ref: "Philippians 4:13",
          text: ")"
        ]
      },
      question220: %{
        title: "What is the doxology of the Lord’s Prayer?",
        paragraph: [
          text: """
            The doxology which the Church adds to the Lord’s Prayer is: “For thine is the kingdom, and
            the power, and the glory, for ever and ever. Amen.”
          """
        ]
      },
      question221: %{
        title: "What does “kingdom, power, and glory” mean?",
        paragraph: [
          text: """
            Referring back to the first half of the Lord’s Prayer, the Church rejoices that God can fulfill
            its requests, for he is already reigning over all creation, working out his holy will, and being
            hallowed by praise in both earth and heaven. (
          """,
          ref: "Revelation 5:11-14",
          text: ")"
        ]
      },
      question222: %{
        title: "Why is the doxology regularly added to the Lord’s Prayer?",
        paragraph: [
          text: """
            Rejoicing that God is already King over this sin-sick world, the Church on earth uses this
            doxology to join in the praise being given to God in heaven. (
          """,
          ref: "Revelation 15:3-4",
          text: ")"
        ]
      },
      question223: %{
        title: "Why do you end the Lord’s Prayer by saying “Amen”?",
        paragraph: [
          text: """
            By saying “Amen,” which means “so be it,” I unite with the faithful, who pray as Jesus
            directed, believe that their petitions please the Father, and trust that he will answer their
            requests. (
          """,
          ref: "Revelation 19:1-4",
          text: ")"
        ]
      },
      question224: %{
        title: "How should you use the Holy Scriptures in daily life?",
        paragraph: [
          text: """
            I should “hear, read, mark, learn, and inwardly digest them” that by the sustaining power of
            God’s Word, I may embrace and hold fast to the hope of everlasting life given to me in Jesus
            Christ. (Scripture Collect, Book of Common Prayer)
          """
        ]
      },
      question225: %{
        title: "How should you “hear” the Bible?",
        paragraph: [
          text: """
            I should hear the Bible through regular participation in the Church’s worship, both
            corporate and domestic, in which I join in reciting Scripture, hear it read and prayed, and
            listen to its truth proclaimed.
          """
        ]
      },
      question226: %{
        title: "How should you “read” the Bible?",
        paragraph: [
          text: """
            I should read the Bible in daily portions as set out in “lectionaries” – Bible reading guides
            found in the Prayer Book and elsewhere. I should also study individual books of the Bible,
            using resources such as commentaries and Bible dictionaries when possible.
          """
        ]
      },
      question227: %{
        title: "How should you “mark” passages of Scripture?",
        paragraph: [
          text: """
            I should read the Bible attentively, noting key verses and themes. I should also note
            connections between passages of Scripture in the Old and New Testaments in order to grasp
            the full meaning of God’s Word.
          """
        ]
      },
      question228: %{
        title: "How should you “learn” the Bible?",
        paragraph: [
          text: """
            I should seek to know the whole of Scripture, and to memorize key passages for my own
            spiritual growth and for sharing with others.
          """
        ]
      },
      question229: %{
        title: "How should you “inwardly digest” Scripture?",
        paragraph: [
          text: """
            I should ground my prayers in the Scriptures. One time-tested way of doing this is to pray
            the Psalms, which formed Jesus’ own prayer book. As I absorb Scripture, it becomes the lens
            through which I perceive and understand the events in my life and the world around me, and
            guides my attitudes and actions.
          """
        ]
      },
      question230: %{
        title: "Are there different ways to pray?",
        paragraph: [
          text: """
            Yes. Prayer can be private or public, liturgical or extemporaneous;
            personal prayer can be
            vocal, meditative, or contemplative.
          """
        ]
      },
      question231: %{
        title: "What is vocal prayer?",
        paragraph: [
          text: "In vocal prayer I pray to God using spoken words."
        ]
      },
      question232: %{
        title: "What is thanksgiving?",
        paragraph: [
          text: """
            In thanksgiving I express my gratitude to God for his grace, favor, providential goodness,
            and answers to my prayers.
          """
        ]
      },
      question233: %{
        title: "What is petition?",
        paragraph: [
          text: "In petition I make requests to God on my own behalf."
        ]
      },
      question234: %{
        title: "What is intercession?",
        paragraph: [
          text: "In intercession I make requests to God on the behalf of others."
        ]
      },
      question235: %{
        title: "What is meditation?",
        paragraph: [
          text: """
            In meditation I prayerfully read and reflect upon Holy Scripture according to its intended
            meaning, with openness to personal spiritual direction from God.
          """
        ]
      },
      question236: %{
        title: "What is contemplation?",
        paragraph: [
          text: """
            In contemplation I lift my heart in love to God without any deliberate flow of thoughts or
            words.
          """
        ]
      },
      question237: %{
        title: "How should you pray?",
        paragraph: [
          text: """
            I should pray with humility, love, and a ready openness to God’s will, in my heart hearing
            God say, “be still and know that I am God.” (
          """,
          ref: "Psalm 46:10-11",
          ref: "2 Chronicles 7:14-15",
          ref: "Philippians 4:6",
          text: ")"
        ]
      },
      question238: %{
        title: "Of what should you be certain in prayer?",
        paragraph: [
          text: """
            I should be certain that God hears my prayers. I should also be certain that in response he
            will grant me all that I actually need, by his wisdom, in his time, and for his glory.
            (
          """,
          ref: "Deuteronomy 6:24",
          ref: "Esther 4:16",
          ref: "Proverbs 15:29",
          ref: "Ephesians 3:14-21",
          text: ")"
        ]
      },
      question239: %{
        title: "What should you remember when prayers seem to be unanswered?",
        paragraph: [
          text: """
            God always hears my prayers, and answers them in his wisdom and in his own time,
            sometimes withholding blessings for my discipline, and sometimes giving better than I ask.
            (
          """,
          ref: "Matthew 6:8",
          text: ")"
        ]
      },
      question240: %{
        title: "How should you pray in times of suffering?",
        paragraph: [
          text: """
            I should join my sufferings to those of Jesus Christ, trusting in the sufficiency of his grace,
            and joyfully assured that “suffering produces endurance, and endurance produces character,
            and character produces hope, and hope does not put us to shame.” (
          """,
          ref: "Romans 5:3-5",
          ref: "2 Corinthians 1:5",
          ref: "Philippians 3:10",
          ref: "Hebrews 5:8-9",
          text: ")"
        ]
      },
      question241: %{
        title: "What obstacles may hinder your prayers?",
        paragraph: [
          text: """
            My prayers may be hindered by distractions, laziness, pride, selfishness, discouragement, sin,
            and lack of faith.
          """
        ]
      },
      question242: %{
        title: "What is liturgy?",
        paragraph: [
          text: """
            Liturgy is the public worship of God by God’s people according to an established pattern or 
            form.
          """
        ]
      },
      question243: %{
        title: "Why do Anglicans worship with a structured liturgy?",
        paragraph: [
          text: """
            Anglicans worship with a structured liturgy because it is a biblical pattern displayed in both
            Testaments, and because it fosters in us a reverent fear of God.
          """
        ]
      },
      question244: %{
        title: "Do form and structure inhibit freedom in worship?",
        paragraph: [
          text: "No. Form and structure provide a setting for freedom of heart in worship."
        ]
      },
      question245: %{
        title: "How does the Book of Common Prayer organize the liturgy?",
        paragraph: [
          text: """
            In the Church’s Prayer Book, Scripture is arranged for daily, weekly, and seasonal prayer and
            worship, and for special events of life. Most services include the Lord’s Prayer.
          """
        ]
      },
      question246: %{
        title: "What is the liturgy of the Daily Office?",
        paragraph: [
          text: """
            The Daily Office consists of Morning and Evening Prayer. These services are based on
            Israel’s Morning and Evening Prayer as adopted and adapted by the early Church. In them
            we confess our sins and receive absolution, hear God’s Word and praise him with Psalms,
            and offer the Church’s thanksgivings and prayers.
          """
        ]
      },
      question247: %{
        title: "Who observes the Daily Office?",
        paragraph: [
          text: """
            Many Christians observe the Daily Office—at church, in their homes, at the family table, or
            wherever they may find themselves.
          """
        ]
      },
      question248: %{
        title: "Why do Anglicans pray Morning and Evening Prayer?",
        paragraph: [
          text: """
            Anglicans pray the Daily Office believing it to be a sacrifice that pleases God, and because it
            keeps them aware that their time is sanctified to God.
          """
        ]
      },
      question249: %{
        title: "What is a collect?",
        paragraph: [
          text: """
            A collect is a form of petition that collects the people’s prayers. Over the centuries, the
            Church has gathered its most cherished prayers to mark times and seasons. They are
            embodied for Anglicans in the Book of Common Prayer.
          """
        ]
      },
      question250: %{
        title: "Why use the Prayer Book when you have the Bible?",
        paragraph: [
          text: """
            The Book of Common Prayer is saturated with the Bible, organizing and orchestrating the
            Scriptures for worship. It leads the Church to pray in one voice with order, beauty, deep
            devotion, and great dignity.
          """
        ]
      },
      question251: %{
        title: "What is a rule of life?",
        paragraph: [
          text: """
            A rule of life is a devotional discipline in which I commit to grow in grace as I resist sin and
            temptation, and to order my worship, work, and leisure as a pleasing sacrifice to God.
            (
          """,
          ref: "Romans 12:1-2",
          text: ")"
        ]
      },
      question252: %{
        title: "Why do you need a rule of life?",
        paragraph: [
          text: """
            I need a rule of life because my fallen nature is disordered, distracted, and self-centered.
            Because bad habits often rule my life, I need to establish godly habits that form Christ-like
            character.
          """
        ]
      },
      question253: %{
        title: "What is the Anglican rule of life?",
        paragraph: [
          text: """
            The Church invites me to its life of Common Prayer as a rule of life. That rule is a key part
            of a life of witness, service, and devotion of my time, money and possessions to God.
          """
        ]
      },
      question254: %{
        title: "What prayers should you memorize as a part of your rule of life?",
        paragraph: [
          text: """
            After memorizing the Lord’s Prayer, I should aim to memorize the liturgy, Psalms, and other
            prayers and collects.
          """
        ]
      },
      question255: %{
        title: "How can you cultivate a fruitful life of prayer?",
        paragraph: [
          text: """
            I can cultivate a fruitful prayer life by following the ancient three-fold rule: weekly
            Communion, Daily Offices, and private devotions. This rule teaches me when to pray, how
            to pray, and for what to pray, so that I may grow to love and glorify God more fully. 
          """
        ]
      },
      question256: %{
        title: "Why did God give the Ten Commandments?",
        paragraph: [
          text: """
            God’s holy Law is a light to show me his character, a mirror to show me myself, a tutor to
            lead me to Christ, and a guide to help me love God and others as I should. (
          """,
          ref: "Deuteronomy 4:32-40",
          ref: "Psalm 19",
          ref: "Psalm 119:97-104",
          ref: "Romans 7:7-12",
          ref: "Romans 13:8-10",
          ref: "Galatians 3:19-26",
          ref: "James 1:21-25",
          ref: "James 2:8-13",
          text: ")"
        ]
      },
      question257: %{
        title: "When did God give the Ten Commandments?",
        paragraph: [
          text: """
            After saving his people Israel from slavery in Egypt through the Ten Plagues, the Passover
            sacrifice, and crossing of the Red Sea, God gave them the Ten Commandments at Mount
            Sinai as covenant obligations. (
          """,
          ref: "Exodus 6:1-8",
          ref: "Exodus 13:3",
          ref: "Exodus 14:26-31",
          ref: "Exodus 19:1-6",
          ref: "Exodus 20:1-2",
          ref: "Deuteronomy 5:1-5",
          text: ")"
        ]
      },
      question258: %{
        title: "How did God give the Ten Commandments?",
        paragraph: [
          text: """
            God gave them to Moses audibly and awesomely, from the midst of the cloud, thus
            revealing his holiness, and afterward writing them on stone tablets. (
          """,
          ref: "Exodus 19",
          ref: "Exodus 32:15-16",
          text: ")"
        ]
      },
      question259: %{
        title: "How should you understand the Commandments?",
        paragraph: [
          text: """
            There are four guiding principles: though stated negatively, each commandment calls for
            positive action, forbids whatever hinders its keeping, calls for loving, God-glorifying
            obedience, and requires that I urge others to be governed by it, as I am myself.
          """
        ]
      },
      question260: %{
        title: "What is our Lord Jesus Christ’s understanding of these Commandments?",
        paragraph: [
          text: """
            Jesus summed them up positively by saying: “You shall love the Lord your God with all your
            heart and with all your soul and with all your mind. This is the great and first commandment.
            And a second is like it: You shall love your neighbor as yourself. On these two
            commandments depend all the Law and the Prophets.” (
          """,
          ref: "Matthew 22:37-40",
          text: "see also ",
          ref: "John 15:7-17",
          ref: "1 Thessalonians 4:1-8",
          text: ")"
        ]
      },
      question261: %{
        title: "Why can you not do this perfectly?",
        paragraph: [
          text: """
            While God made mankind to love him perfectly, sin has corrupted our nature, leading me to
            resist him, to ignore his will, and to care more for myself than for my neighbors. (
          """,
          ref: "Psalm 14:1",
          ref: "Romans 3:9-23",
          ref: "7:21-25",
          ref: "1 Corinthians 2:14",
          text: ")"
        ]
      },
      question262: %{
        title: "When will you love God perfectly?",
        paragraph: [
          text: """
            I will only love God perfectly when he completes his work of grace in me at the end of the
            age. (
          """,
          ref: "Philippians 1:6",
          ref: "1 John 3:2-3",
          text: ")"
        ]
      },
      question263: %{
        title: "Why then do you learn God’s Law now?",
        paragraph: [
          text: """
            I learn God’s Law now so that, having died to sin in Christ, I might love him as I ought,
            delight in his will as he heals my nature, and live for his glory. (
          """,
          ref: "Deuteronomy 11:18-21",
          ref: "Psalm 1:1-3",
          ref: "Psalm 119:89-104",
          ref: "Romans 6:1-4,11",
          ref: "1 John 3:23-24",
          ref: "1 John 4:7-9, 19",
          ref: "1 John 5:1-3",
          text: ")"
        ]
      },
      question264: %{
        title: "How does God prepare you to begin living his Law?",
        paragraph: [
          text: """
            Through faith, repentance and Baptism, God in grace washes away my sin, gives me his
            Holy Spirit, and makes me a member of Christ, a child of God, and an heir of the Kingdom
            of Heaven. (
          """,
          ref: "Acts 22:16",
          ref: "Titus 3:4-8",
          text: ")"
        ]
      },
      question265: %{
        title: "How does the Church help you to live out God’s law?",
        paragraph: [
          text: """
            The Church exercises godly authority and discipline over me through the ministry of
            baptismal sponsors, clergy, and other teachers. (
          """,
          ref: "Romans 15:1-7",
          ref: "2 Timothy 3:14-15",
          ref: "Hebrews 13:7, 17",
          text: ")"
        ]
      },
      question266: %{
        title: "How does the Lord’s Supper enable you to continue learning and living God’s Law?",
        paragraph: [
          text: """
            In the Lord’s Supper or Holy Eucharist, I hear the Law read, hear God’s good news of
            forgiveness, recall my baptismal promises, have my faith renewed, and receive grace to
            follow Jesus in the ways of God’s Laws and in the works of his Commandments.
          """
        ]
      },
      question267: %{
        title: "What is the First Commandment?",
        paragraph: [
          text: """
            The First Commandment is: “I am the Lord your God, You shall have no other gods before
            me.”
          """
        ]
      },
      question268: %{
        title: "What does it mean to have no other gods?",
        paragraph: [
          text: """
            It means that there should be nothing in my life more important than God and obeying his
            will. I should love, revere, trust, and worship him only. (
          """,
          ref: "Exodus 34:14",
          ref: "Deuteronomy 6:4, 10-15",
          ref: "Deuteronomy 12:29-31",
          ref: "Jeremiah 10:6-10",
          ref: "Matthew 4:10",
          ref: "Matthew 28:8-20",
          text: ")"
        ]
      },
      question269: %{
        title: "Can you worship God perfectly?",
        paragraph: [
          text: """
            No. Only our Lord Jesus Christ worshiped God perfectly. He leads the Church today to seek
            to do the same. (
          """,
          ref: "Matthew 4:1-11",
          ref: "Matthew 26:36-46",
          ref: "Revelation 4-5",
          text: ")"
        ]
      },
      question270: %{
        title: "Why are you tempted to worship other gods?",
        paragraph: [
          text: """
            I am tempted because my sinful heart is still drawn to false gods and their appeal for my 
            allegiance. (
          """,
          ref: "Ephesians 5:1-21",
          ref: "James 4:1-10",
          ref: "1 John 1:8-10",
          ref: "1 John 5:20-21",
          text: ")"
        ]
      },
      question271: %{
        title: "How are you tempted to worship other gods?",
        paragraph: [
          text: """
            I am tempted to trust in my self, possessions, relationships, and success, believing that they
            will give me happiness, security, and meaning. I am also tempted to believe superstitions and
            false religious claims, and to reject God’s call to worship him alone. (
          """,
          ref: "Psalm 73:1-17",
          ref: "Romans 1:18-32",
          text: ")"
        ]
      },
      question272: %{
        title: "What is the Second Commandment?",
        paragraph: [
          text: """
            The Second Commandment is: “You shall not make for yourself a carved image, or any
            likeness of anything that is in heaven above, or that is in the earth beneath, or that is in the
            water under the earth. You shall not bow down to them or serve them.”
          """
        ]
      },
      question273: %{
        title: "What does the Second Commandment mean?",
        paragraph: [
          text: """
            God’s people are neither to worship man-made images of God or of other gods, nor make
            such images for the purpose of worshiping them. (
          """,
          ref: "Deuteronomy 4:15-24",
          text: ")"
        ]
      },
      question274: %{
        title: "How did Israel break the first two commandments?",
        paragraph: [
          text: """
            Israel worshiped the gods of the nations around them, neglected God’s Law, and corrupted
            the worship of the Temple, thus earning God’s punishment. (
          """,
          ref: "Exodus 32",
          ref: "Judges 2:11-15",
          ref: "Psalm 78:56-72",
          ref: "Jeremiah 32:30-35",
          text: ")"
        ]
      },
      question275: %{
        title: "Why did the nations make such images?",
        paragraph: [
          text: """
            Israel’s neighbors worshiped false gods by means of images, or idols, believing they could
            manipulate these imaginary gods to gain favor with them. (
          """,
          ref: "Isaiah 40:18-26",
          ref: "Isaiah 44:9-20",
          text: ")"
        ]
      },
      question276: %{
        title: "Are all carved images wrong?",
        paragraph: [
          text: """
            No. God, who forbids the making of idols and worship of images, commanded carvings and
            pictures for the Tabernacle. These represented neither God nor false gods, but rather angels,
            trees, and fruits from the Garden of Eden. (
          """,
          ref: "Exodus 37:1-9",
          ref: "Exodus 39:22-26",
          ref: "1 Kings 6:14-19",
          text: ")"
        ]
      },
      question277: %{
        title: "Are idols always carved images?",
        paragraph: [
          text: """
            No. Relationships, habits, aspirations, and ideologies can become idols in my mind if I look
            to them for salvation from misery, guilt, poverty, loneliness, or despair. (
          """,
          ref: "Ezekiel 14:4-5",
          ref: "Isaiah 2:20",
          ref: "Ephesians 5:2",
          ref: "1 John 5:21",
          text: ")"
        ]
      },
      question278: %{
        title: "How was Jesus tempted to break the first two commandments?",
        paragraph: [
          text: """
            Satan tempted Jesus to bow down and worship him, promising him a world kingdom 
            without the pain of the cross. Instead, Jesus loved and worshiped God faithfully and
            perfectly all his life. He chose the will of his Father over the promises of the Devil, and
            accepted the cross. (
          """,
          ref: "Matthew 4:1-11",
          ref: "Luke 22:39-49",
          ref: "Hebrews 4:14-16",
          text: ")"
        ]
      },
      question279: %{
        title: "How will idolatry affect you?",
        paragraph: [
          text: """
            If I worship idols I will become like them, empty and worthless, and alienated from God, the
            only One who can make me whole. (
          """,
          ref: "Psalm 115:4-8",
          ref: "Jeremiah 2:11-19",
          ref: "Romans 1:18-32",
          text: ")"
        ]
      },
      question280: %{
        title: "How can you love God in worship?",
        paragraph: [
          text: """
            The Holy Scriptures teach me how to worship God, and the Church’s liturgy guides my
            worship in keeping with the Scriptures. I can show love to God by worshiping him in this
            way. (
          """,
          ref: "Romans 12:1-2",
          ref: "Hebrews 9:11-14",
          ref: "Hebrews 10:11-25",
          ref: "Hebrews 12:18-29",
          ref: "Hebrews 13:1-19",
          text: ")"
        ]
      },
      question281: %{
        title: "What is the Third Commandment?",
        paragraph: [
          text:
            "The Third Commandment is: “You shall not take the name of the Lord your God in vain.”"
        ]
      },
      question282: %{
        title: "What does it mean not to take God’s Name in vain?",
        paragraph: [
          text: """
            All forms of God’s Name are holy, and those who love him should use his Name with
            reverence, not lightly or for selfish purposes. (
          """,
          ref: "Leviticus 19:12",
          ref: "Psalm 29:2",
          ref: "Psalm 99:1-5",
          ref: "Revelation 15:3",
          text: "; – See Questions 169-175)"
        ]
      },
      question283: %{
        title: "How can you use God’s Name irreverently?",
        paragraph: [
          text: """
            In false or half-hearted worship, oppression of the poor, and conflicts cloaked with divine
            cause, people use God’s Name without reverence for him, and only to further their own
            goals. (
          """,
          ref: "Ezekiel 36:22-23",
          text: ")"
        ]
      },
      question284: %{
        title: "How can you use God’s Name lightly?",
        paragraph: [
          text: """
            Profanity, careless speech, broken vows, open sin, and meaningless exclamations all cheapen
            God’s Name. These treat God’s Name as “empty” of the reality for which it stands.
            (
          """,
          ref: "Matthew 5:33-37",
          articles_of_religion: 39,
          text: ")"
        ]
      },
      question285: %{
        title: "How can you honor God’s Name?",
        paragraph: [
          text: """
            I honor and love God’s Name, in which I was baptized, by keeping my promises and by
            upholding honor in relationships, charity in society, justice in law, uprightness in vocation,
            and holiness in worship. (
          """,
          ref: "Deuteronomy 12:11",
          ref: "Psalm 138:2",
          ref: "Proverbs 30:7-9",
          ref: "Matthew 5:22-23",
          ref: "Ephesians 4:25",
          ref: "James 5:12",
          text: ")"
        ]
      },
      question286: %{
        title: "What is the Fourth Commandment?",
        paragraph: [
          text: "The Fourth Commandment is: “Remember the Sabbath day, to keep it holy.”"
        ]
      },
      question287: %{
        title: "What does it mean to keep the Sabbath day holy?",
        paragraph: [
          text: """
            “Sabbath” is from the Hebrew shavath, which means “rest.” God commanded Israel to set
            apart each seventh day following six days of work for rest and worship. (
          """,
          ref: "Exodus 19:8-11",
          text: ")"
        ]
      },
      question288: %{
        title: "Why should you rest on the Sabbath?",
        paragraph: [
          text: """
            I rest, as Israel was to rest, because God rested on the seventh day from his work of
            creation. The Sabbath rest brought rhythm to life, work, and worship;
            ref: "freedom from slaver",
            to unending labor;
            ref: "and awareness that God is Lord of all time, including mine. ",
          """,
          ref: "Genesis 2:1-2",
          ref: "Deuteronomy 5:12-15",
          text: ")"
        ]
      },
      question289: %{
        title: "Where do you learn about the holiness of time?",
        paragraph: [
          text: """
            In creation, through the sun, moon, and stars;
            in the Law, through Israel’s sacrificial calendar;
            and in the Church’s liturgy, patterned after Temple worship, I learn that time
            belongs to God and is ordered by him. (
          """,
          ref: "Genesis 1:14-15",
          ref: "Numbers 28:9-10",
          ref: "Deuteronomy 16-18",
          text: ")"
        ]
      },
      question290: %{
        title: "Did Jesus keep the Sabbath?",
        paragraph: [
          text: "As its Lord, Jesus both kept and fulfilled the Sabbath. (",
          ref: "Matthew 5:17-20",
          ref: "Mark 2:23-27",
          text: ")"
        ]
      },
      question291: %{
        title: "How does Jesus bring Sabbath as God’s eternal gift to you?",
        paragraph: [
          text: """
            Jesus now offers himself as the source of my true rest—from the slavery of sin, from the
            wasteland of human striving, and from Satan’s legacy of futile toil, pain, disease, and death.
            (
          """,
          ref: "Matthew 11:25-30",
          text: ")"
        ]
      },
      question292: %{
        title: "What does it mean that a Sabbath rest remains for the people of God?",
        paragraph: [
          text: """
            When the Church is perfected in Christ, all believers will be completely free from sin and its
            curse, and established in an eternity of love, adoration, and joy. This will be our unending
            Sabbath rest. (
          """,
          ref: "Isaiah 66: 22-23",
          ref: "Romans 8:18-30",
          ref: "1 Corinthians 15",
          ref: "Hebrews 4",
          text: ")"
        ]
      },
      question293: %{
        title: "How do you celebrate this Sabbath rest with the Church now?",
        paragraph: [
          text: """
            I join in the Church’s weekly worship and participation in God’s heavenly rest, which brings
            order, meaning, and holiness to the other six days of the week. (
          """,
          ref: "Hebrews 4:9-10",
          ref: "Colossians 2:16-19",
          text: ")"
        ]
      },
      question294: %{
        title:
          "Why does the Church worship on the first day of the week rather than the seventh?",
        paragraph: [
          text: """
            The Church worships on the first day of the week in remembrance of the resurrection of our 
            Lord Jesus Christ on the first day of the week. (
          """,
          ref: "Matthew 28:1",
          text: ")"
        ]
      },
      question295: %{
        title: "What is the Fifth Commandment?",
        paragraph: [
          text: "The Fifth Commandment is: “Honor your father and your mother.”"
        ]
      },
      question296: %{
        title: "What does it mean to honor your father and mother?",
        paragraph: [
          text: """
            While still a child, I should obey my parents;
            ref: "and I should honor, serve, respect, love, an",
            care for them all their lives. (
          """,
          ref: "Proverbs 2:10",
          ref: "Proverbs 23:22",
          ref: "Ephesians 6:1-4",
          ref: "Colossians 3:20-21",
          text: ")"
        ]
      },
      question297: %{
        title: "How did Jesus keep the Fifth Commandment?",
        paragraph: [
          text: """
            As a child Jesus submitted himself to Mary and Joseph, and honored his mother even as he
            suffered on the cross by entrusting her to his beloved disciple’s care. (
          """,
          ref: "Luke 2:39-52",
          ref: "John 19:25-27",
          text: ")"
        ]
      },
      question298: %{
        title: "How else do you love God in light of the Fifth Commandment?",
        paragraph: [
          text: """
            I keep the Fifth Commandment in love to God by showing respect for the aged;
            submitting to my teachers, pastors, and directors;
            respecting tradition and civil authority; and ordering
            myself in reverent humility, as is fitting for a servant and child of God. (
          """,
          ref: "Matthew 22:15-22",
          ref: "Romans 13",
          ref: "Colossians 3:18-4:1",
          ref: "1 Tim 6:1-2",
          ref: "Hebrews 13:7,17",
          articles_of_religion: 37,
          text: ")"
        ]
      },
      question299: %{
        title: "Will such an attitude of honor come to you naturally?",
        paragraph: [
          text: "No. “Folly is bound up in the heart of a child” (",
          ref: "Proverbs 22:15",
          text:
            "). From my earliest days, led and driven by sin, I persistently attempt to rule myself."
        ]
      },
      question300: %{
        title: "Does earthly authority have limits?",
        paragraph: [
          text: """
            Yes. All authority comes from God, who is the King of kings and expects me to love, honor,
            and obey him rather than others if they command me to sin. (
          """,
          ref: "Exodus 1:17",
          ref: "Daniel 1:8-16",
          ref: "Daniel 3:16-18",
          ref: "Acts 5:29",
          ref: "Romans 13:1-5",
          ref: "Colossians 4:1",
          ref: "1 Peter 2:14-15",
          text: ")"
        ]
      },
      question301: %{
        title: "What is the Sixth Commandment?",
        paragraph: [
          text: "The Sixth Commandment is: “You shall not murder.”"
        ]
      },
      question302: %{
        title: "What does it mean not to murder?",
        paragraph: [
          text: """
            Since God declares human life sacred from conception to natural death, I may not take the
            life of neighbors unjustly, bear them malice in my heart, or harm them by word or deed;
            rather, I should seek to cause their lives to flourish. (
          """,
          ref: "Genesis 9:6",
          ref: "Leviticus 19:16",
          ref: "Deuteronomy 19:4-7",
          text: ")"
        ]
      },
      question303: %{
        title: "How did Christ cause life to flourish?",
        paragraph: [
          text: """
            Jesus sought the well-being of all who came to him: he made the blind see and the deaf hear,
            caused the lame to walk, cured the sick, fed the hungry, cast out demons, raised the dead,
            and preached good news to all. (
          """,
          ref: "Luke 4:17-21",
          ref: "Matthew 14:13-21, 14:34-36",
          text: ")"
        ]
      },
      question304: %{
        title: "How did Jesus extend the law against murder?",
        paragraph: [
          text: "Jesus equated unjust anger with murder. (",
          ref: "Matthew 5:21-22",
          ref: "1 John 3:15",
          text: ")"
        ]
      },
      question305: %{
        title: "Is your anger always sinful, or can it be just?",
        paragraph: [
          text: """
            Anger can be just if I am motivated not by fear, pride, or revenge, but purely by love for
            God’s honor and my neighbor’s well-being. More often than not, however, human anger is
            sinful. (
          """,
          ref: "Ephesians 4:26-27",
          text: ")"
        ]
      },
      question306: %{
        title: "What other actions may be considered forms of murder?",
        paragraph: [
          text: """
            Suicide, abortion, genocide, infanticide, and euthanasia are forms of murder. Related sins
            include abuse, abandonment, recklessness, and hatred or derision.
          """
        ]
      },
      question307: %{
        title: "Is it always wrong to harm or kill another?",
        paragraph: [
          text: """
            There are rare times when the claims of justice, mercy, and life itself may require doing harm
            or even bringing death to others. It is the particular task of government to do this in society.
            (
          """,
          ref: "Romans 13:1-4",
          text: ")"
        ]
      },
      question308: %{
        title: "How else can you cause life to flourish?",
        paragraph: [
          text: """
            As a witness to the Gospel, I can love God and my neighbor by refraining from selfish
            anger, insults, and cursing, by defending the helpless and unborn, by rescuing those who
            damage themselves, and by helping others to prosper. (
          """,
          ref: "Matthew 5:38-48",
          ref: "9:35-38",
          ref: "Luke 23:34",
          ref: "Acts 10:34-42",
          ref: "Ephesians 4:25-32",
          ref: "Ephesians 5:1-2",
          text: ")"
        ]
      },
      question309: %{
        title: "What is the Seventh Commandment?",
        paragraph: [
          text: "The Seventh Commandment is: “You shall not commit adultery.”"
        ]
      },
      question310: %{
        title: "What does it mean not to commit adultery?",
        paragraph: [
          text: """
            Marriage is holy. Married persons are to be faithful to their spouses as long as they both shall
            live. So I must not engage in sexual activity with anyone other than my spouse.
            (
          """,
          ref: "Deuteronomy 22-24:5",
          ref: "See Questions 128-130",
          text: ")"
        ]
      },
      question311: %{
        title: "Why does God ordain marriage?",
        paragraph: [
          text: """
            God ordains marriage for three important purposes: for the procreation of children to be
            brought up in the nurture and admonition of the Lord; for a remedy against sin and to avoid
            fornication; and for mutual friendship, help, and comfort, both in prosperity and adversity.
            (
          """,
          ref: "Genesis 1:28",
          ref: "Deuteronomy 6:7",
          ref: "Proverbs 22:6",
          ref: "Proverbs 31:10-12",
          ref: "1 Corinthians 7:2-5",
          text: "Book of Common Prayer)"
        ]
      },
      question312: %{
        title: "What does marriage illustrate?",
        paragraph: [
          text: """
            The New Testament reveals that human marriage is meant to reflect the faithful love that
            unites Christ to his Church. (
          """,
          ref: "Ephesians 5:21-33",
          text: ")"
        ]
      },
      question313: %{
        title: "What does it mean to be faithful in marriage?",
        paragraph: [
          text: """
            To be faithful in marriage is to be exclusively devoted in heart, mind, and body to one’s
            spouse in the marriage covenant. (
          """,
          ref: "Ephesians 5:29-31",
          text: ")"
        ]
      },
      question314: %{
        title: "Is divorce ever permitted?",
        paragraph: [
          text: """
            Although he permits divorce in some cases, God hates it. It severs what he has joined, and
            causes immeasurable pain, suffering and brokenness. (
          """,
          ref: "Malachi 2:13-16",
          ref: "Matthew 19:1-12",
          ref: "1 Corinthians 7:12-16",
          text: ")"
        ]
      },
      question315: %{
        title: "How else is the Seventh Commandment broken?",
        paragraph: [
          text: """
            Fornication, same-gender sexual acts, rape, incest, pedophilia, bestiality, pornography, lust,
            or any other form of self-centered sexual desire and behavior, all violate this law. (
          """,
          ref: "Leviticus 18",
          ref: "Romans 1:18-28",
          ref: "Matthew 5:27-30",
          text: ")"
        ]
      },
      question316: %{
        title: "What does it mean for you to be chaste?",
        paragraph: [
          text: """
            It means that I must refrain from sexual acts outside of marriage;
            ref: "and I must respect mysel",
            and all others in body, mind, and spirit;
            ref: "practice sexual purity",
            ref: "and view others as imag",
            bearers of God, not as objects of personal gratification. (
          """,
          ref: "1 Thessalonians 4:3-7",
          text: ")"
        ]
      },
      question317: %{
        title: "How do you benefit from chastity?",
        paragraph: [
          text: """
            Chastity enables me to give of myself in friendship, avoid difficulty in marriage, and
            experience the true freedom of integrity before God. (
          """,
          ref: "1 Corinthians 7:32-35",
          text: ")"
        ]
      },
      question318: %{
        title: "What is the Eighth Commandment?",
        paragraph: [
          text: "The Eighth Commandment is: “You shall not steal.”"
        ]
      },
      question319: %{
        title: "What does it mean not to steal?",
        paragraph: [
          text: """
            Because God is Creator and Lord of this world, the created order is holy, and all things 
            fundamentally belong to him. Since I am required to love God and my neighbor, I must not
            take what does not belong to me, and I must be true, honest, and just in all my business
            dealings. (
          """,
          ref: "Leviticus 19:10-12",
          ref: "Ephesians 4:28",
          articles_of_religion: 38,
          text: ")"
        ]
      },
      question320: %{
        title:
          "If the earth and all it contains is the Lord’s, is it fitting for you to own property or goods?",
        paragraph: [
          text: """
            Yes. However, everything I own I hold as God’s steward, to cultivate and use for his glory
            while respecting what he has entrusted to others. (
          """,
          ref: "Genesis 1-2",
          ref: "Genesis 9",
          ref: "Leviticus 25-27",
          ref: "Psalm 24:1",
          text: ")"
        ]
      },
      question321: %{
        title: "How did God teach Israel to respect the property of others?",
        paragraph: [
          text: """
            God gave land and possessions as a trust from him, which could be bought, sold, and
            inherited. He required restitution when property was stolen, and forbade unjust loans and
            interest. (
          """,
          ref: "Exodus 22:1",
          ref: "Leviticus 25:36-37",
          ref: "Numbers 27",
          ref: "Numbers 33:50-36:12",
          text: ")"
        ]
      },
      question322: %{
        title: "What things other than property can you steal?",
        paragraph: [
          text: """
            I can steal reputation, wages, and honor; credit, answers, and inventions; friendship, hope,
            and goodwill from others. I must repay and, to the best of my ability, restore what I have
            stolen. (
          """,
          ref: "Deuteronomy 24:14-15, 24:17-18",
          ref: "2 Samuel 11-15",
          ref: "1 Kings 21",
          text: ")"
        ]
      },
      question323: %{
        title: "As his steward, how does God require you to use your possessions?",
        paragraph: [
          text: """
            As I am able, I should earn my own living so that I may set aside offerings for worship, give
            alms to the poor, and care for my dependents;
            ref: "and I should use all my possessions, gifts an",
            abilities to glorify God, better the state of the creation, and love my neighbors. (
          """,
          ref: "Proverbs 19:17",
          ref: "Proverbs 30:8-9",
          ref: "1 Corinthians 16:2",
          ref: "Ephesians 4:28",
          text: ")"
        ]
      },
      question324: %{
        title: "What is the minimum standard of giving for you as a Christian?",
        paragraph: [
          text: """
            A tithe, which is ten percent of my income, is the minimum standard and goal of giving for
            the work of God;
            ref: "yet Jesus expects more than my minimum. ",
          """,
          ref: "Deuteronomy 14:22-29",
          ref: "Luke 21:1-4",
          text: ")"
        ]
      },
      question325: %{
        title: "What is the Ninth Commandment?",
        paragraph: [
          text:
            "The Ninth Commandment is: “You shall not bear false witness against your neighbor.”"
        ]
      },
      question326: %{
        title: "What does it mean not to bear false witness?",
        paragraph: [
          text: """
            It means that I am to love God and my neighbor by speaking truthfully and graciously at all
            times, and by keeping my tongue from lying, slander, or gossip. (
          """,
          ref: "Proverbs 6:19",
          ref: "Matthew 5:33-37",
          ref: "Matthew 12:36",
          ref: "Ephesians 4:15-16",
          text: ")"
        ]
      },
      question327: %{
        title: "How did Jesus suffer from false witness?",
        paragraph: [
          text: "The Sanhedrin, desiring Jesus’ execution, hired witnesses to lie about him. (",
          ref: "Psalm 109:1-3",
          ref: "Mark 14:53-58",
          text: ")"
        ]
      },
      question328: %{
        title: "How does Jesus bear true witness?",
        paragraph: [
          text: """
            Jesus always speaks the truth about himself and me, and bears witness before God and Satan
            that I belong to him. (
          """,
          ref: "John 17:6-8",
          ref: "John 18:19-24",
          text: ")"
        ]
      },
      question329: %{
        title: "How is false witness borne in court?",
        paragraph: [
          text:
            "False accusations, lies, withholding evidence, or an unjust verdict all violate truth and justice. (",
          ref: "Exodus 23:1",
          text: ")"
        ]
      },
      question330: %{
        title: "When is it right to speak of your neighbor’s sins?",
        paragraph: [
          text: """
            I am forbidden to gossip or slander, but I must speak the truth in love to my neighbor,
            report crimes, advocate for the helpless, and protect the community. (
          """,
          ref: "Ephesians 4:15",
          ref: "Leviticus 19:17-18",
          ref: "Matthew 18:15",
          ref: "James 5:18-20",
          text: ")"
        ]
      },
      question331: %{
        title: "What is the Tenth Commandment?",
        paragraph: [
          text: "The Tenth Commandment is: “You shall not covet.”"
        ]
      },
      question332: %{
        title: "What does it mean not to covet?",
        paragraph: [
          text: """
            I am not to let envy make me want what others have, but in humility should be content with
            what I have. (
          """,
          ref: "Micah 2:1-2",
          ref: "Hebrews 13:5-6",
          ref: "Philippians 4:10-13",
          text: ")"
        ]
      },
      question333: %{
        title: "How did Jesus practice contentment?",
        paragraph: [
          text: """
            In contentment, Jesus took on the form of a servant without wealth or possessions, and in
            his earthly life loved and trusted his Father in all things. (
          """,
          ref: "Matthew 6:25-34",
          ref: "Philippians 2:3-11",
          text: ")"
        ]
      },
      question334: %{
        title: "How is covetousness especially dangerous?",
        paragraph: [
          text: """
            Covetousness begins with discontent in mind and spirit, and as it grows in the heart, it can
            lead to sins such as idolatry, adultery, and theft. (
          """,
          ref: "2 Samuel 11:1-4",
          ref: "1 Kings 21:1-15",
          ref: "Luke 12:15",
          ref: "James. 1:15",
          text: ")"
        ]
      },
      question335: %{
        title: "What should you do instead of coveting?",
        paragraph: [
          text: """
            I should think often of the inheritance that Jesus has prepared for me, meditate upon his
            care for the birds of the air and the flowers of the field, be generous with what God has 
            entrusted to me, and help others to keep what is rightfully theirs. (
          """,
          ref: "Matthew 6:25-34",
          ref: "Romans 12:13",
          ref: "Philippians 4:8",
          ref: "Hebrews 13:5",
          ref: "1 Timothy 6:6-10",
          ref: "1 Peter 1:3-5",
          text: ")"
        ]
      },
      question336: %{
        title: "Is it possible for you to keep all these commandments?",
        paragraph: [
          text: """
            No. I fail to fulfill them perfectly, however hard I try. One purpose of the Law is to show
            me my utter inability to obey God flawlessly, and so to point to my need of Christ’s
            obedience and atoning death on my behalf. (
          """,
          ref: "Isaiah 53:4-6",
          ref: "Romans 3:19-31",
          ref: "Hebrews 10:1-14",
          text: ")"
        ]
      },
      question337: %{
        title:
          "Since you cannot keep God’s commandments perfectly, what has Jesus done on your behalf?",
        paragraph: [
          text: """
            As the perfect human and the unblemished Lamb, Jesus has offered himself to God,
            suffering death for my redemption upon the cross, which is the once for all “sacrifice,
            oblation, and satisfaction for the sins of the whole world.” (1662 Book of Common Prayer;
          """,
          ref: "Hebrews 10:10,12",
          text: ")"
        ]
      },
      question338: %{
        title: "Does Christ’s obedience excuse you from personal obedience?",
        paragraph: [
          text: """
            No. Obedience is always due to God as our Father, Lord, and Creator. Despite my sin and
            weakness, I should strive always to obey him, looking to Jesus for salvation and to the Holy
            Spirit for strength. (
          """,
          ref: "John 14:15-16, 23-24",
          text: ")"
        ]
      },
      question339: %{
        title: "What is the first benefit of Christ’s sacrifice?",
        paragraph: [
          text: """
            My sins are forgiven when I confess them and ask for pardon through Christ’s shed blood. I
            live by being forgiven. (
          """,
          ref: "1 John 1:8-9",
          ref: "Hebrews 9:11-12",
          text: ")"
        ]
      },
      question340: %{
        title: "Are you still broken, despite God’s forgiveness?",
        paragraph: [
          text: """
            Yes. Sin leaves me wounded, lonely, afraid, divided, and in need of Christ’s healing ministry.
            (
          """,
          ref: "Psalm 32:1-5",
          ref: "Psalm 51",
          ref: "Psalm 130",
          ref: "Matthew 15:19",
          ref: "1 John 2:1-2",
          text: ")"
        ]
      },
      question341: %{
        title: "How does Jesus heal you?",
        paragraph: [
          text: """
            Through the gift and fruit of the Holy Spirit, Jesus mends my disordered soul from the
            effects of sin in my mind, will, and desire. (
          """,
          ref: "Acts 2:38",
          ref: "Romans 8:26",
          ref: "Romans 12:2",
          text: ")"
        ]
      },
      question342: %{
        title: "What is this healing called?",
        paragraph: [
          text: """
            This healing is called sanctification. In it, by the work of the Holy Spirit, my mind, will, and
            desires are progressively transformed and conformed to the character of Jesus Christ.
            (
          """,
          ref: "Romans 12:1-2",
          ref: "Ephesians 2:1-3",
          ref: "Ephesians 3:14-21",
          ref: "Ephesians 4:17-19",
          ref: "Philippians 2",
          ref: "Colossians 2-4",
          ref: "1 John 3:2-3",
          text: ")"
        ]
      },
      question343: %{
        title: "What does the Church offer you as helps for your sanctification?",
        paragraph: [
          text: """
            The Church’s teaching, sacraments, liturgies, seasons, ministry, oversight, and fellowship
            assist my growth in Christ and are channels of God’s abundant care for my soul. (
          """,
          ref: "Ephesians 4-6",
          ref: "Philippians 3",
          ref: "Colossians 3",
          ref: "Ascensiontide Collects",
          text: ")"
        ]
      },
      question344: %{
        title: "For what does sanctification prepare you?",
        paragraph: [
          text: """
            Sanctification prepares me for the vision and glory of God in conformity to my Lord Jesus
            Christ, who has promised that “the pure in heart shall see God.” (
          """,
          ref: "Matthew 5:8",
          text: ")"
        ]
      },
      question345: %{
        title: "With what attitude should I live a life of sanctification?",
        paragraph: [
          text: """
            God calls me to a life of joy. Constant thoughts of God’s love for me, and of my hope in
            Christ, will keep me always rejoicing. (
          """,
          ref: "Philippians 4:4",
          ref: "1 Thessalonians 5:16-19",
          text: ")"
        ]
      }
    }
  end
end

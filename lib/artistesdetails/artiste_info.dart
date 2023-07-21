import 'dart:math';

import 'artise_details.dart';

class ArtisteInfo {
  int listLength() {
    return artisteInfo.length;
  }

  final List<ArtisteDetails> artisteInfo = [
    ArtisteDetails(
        artistCount: '2,000,000',
        artistName: 'Wizkid',
        artistAbout:
            "Singer/songwriter Wizkid is one of Nigeria's biggest R&B crossover acts, having worked with Drake, Skepta, and Chris Brown, among others. He first found regional success in 2011 with the massively popular single 'Holla at Your Boy,' which appeared on his debut album, Superstar. Wizkid went global in 2016 after his collaboration with Drake, 'One Dance,' soared to number one in 15 countries, resulting in a multi-album deal with RCA, which issued his Caribbean-influenced major-label debut, Sounds from the Other Side, in 2017. The acclaimed Made in Lagos followed in 2021, featuring the internationally charting hit single 'Essence.' Just one year later, Wizkid followed up with his fifth album, More Love, Less Ego.",
        artistImage:
            'https://myvipmodels.ch/wp-content/uploads/2023/06/wiz-2.jpg',
        artistFollowers: '1,200,000',
        artistRealName: 'Ayodeji\nIbrahim\nBalogun',
        artistAbout2:
            'Wizkid began his career in music when he was just 11 years old. His first record, Lil Prinz, was recorded in 2001 in collaboration with Glorious Five, a group consisting of Balogun and his friends from church. In 2006, he started pursuing music full-time, first collaborating with various Nigerian pop acts including OJB Jezreel, Naeto C, and Banky W. By 2011, he was ready to record his debut studio album as a solo artist; Superstar was released by Empire Mates Entertainment (EME for short) to great critical and public acclaim across Africa, propelling Wizkid to stardom in his home country.',
        artistVerified: true,
        instagramHandle:
            'https://instagram.com/wizkidayo?igshid=NTc4MTIwNjQ2YQ=='),
    ArtisteDetails(
        artistCount: '1,800,000',
        artistName: 'Davido',
        artistAbout:
            "Nigerian vocalist/producer Davido blends traditional African elements with global mainstream pop for a sound that's equal parts intriguing and infectious. He quickly grew from club-ready early songs to charting tracks and features from big names like Nicki Minaj and Chris Brown on his 2020 album A Better Time, which cracked the Billboard 200. His fourth LP, 2023's Timeless, continued his successful run and featured star guests like Angélique Kidjo and Skepta.",
        artistImage:
            'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1240w,f_auto,q_auto:best/rockcms/2022-11/221102-davido-mn-0930-ebe167.jpg',
        artistFollowers: '1,300,000',
        artistRealName: 'David\nAdedeji\nAdeleke',
        artistAbout2:
            'Davido was born David Adedeji Adeleke in Atlanta, Georgia, in 1992. His interest in music began while attending Oakwood University in his late teens, and he started making his own beats and investigating music production. He dropped out of school and began pursuing music full-time, relocating to Lagos, Nigeria, and releasing his debut single, "Back When," in 2011. The single received some attention for its mix of clubby production, high-energy vocals, and Afro-pop rhythms, and was followed shortly by second single "Dami Duro." Work began on his debut album, Omo Baba Olowo, which was released in 2012 and produced a plethora of singles.',
        artistVerified: true,
        snapHandle: 'https://www.snapchat.com/add/davido',
        youtubeHandle: 'https://youtube.com/@DavidoOfficial',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '3,000,000',
        artistName: 'Burna Boy',
        artistAbout:
            "With his fusion of dancehall, reggae, Afrobeat, and pop, Burna Boy emerged in the early part of the 2010s as one of Nigeria's fastest-rising stars. The LeriQ-produced 2012 single 'Like to Party' proved to be his breakout track and paved the way for his full-length debut, L.I.F.E, a year later. Over the next five years, Burna released two more albums and collaborated with a variety of artists, from J Hus and Skales to Fall Out Boy and Lilly Allen. His international exposure widened with 2018's Outside, which hit number three on the Billboard Reggae chart and won the Nigeria Entertainment Award for Album of the Year. 2019's African Giant and 2020's Twice as Tall were both widely acclaimed and charted in several countries. After becoming the first Nigerian to headline a show at Madison Square Garden, he released his sixth album, Love, Damini, in 2022.",
        artistImage:
            'https://images.sportsbrief.com/images/1120/f23794896ea06c71.webp?v=1',
        artistFollowers: '1,500,000',
        artistRealName: 'Damini\nOgulu',
        artistAbout2:
            "Burna Boy was born Damini Ogulu in Port Harcourt, Rivers State, Nigeria, in 1991. He began making music at just ten years old when a fellow classmate at school gave him a copy of the production software FruityLoops. Armed with these means, he began to create his own beats on an old computer. After he graduated, he moved to London to attend university, but he dropped out after two years and moved back to Nigeria. In 2010, the 19-year-old Ogulu traveled to Nigeria's southern coast, where a mutual acquaintance, producer LeriQ, had some studio space. This marked a period when he began to connect to the music of his native country, having spent most of his youth immersed in American acts like DMX. He delved into the dancehall and reggae music his father listened to and explored the Afro-beat music preferred by his grandfather (who had also been Fela Kuti's first manager). As a result of his new discoveries, Ogulu created a confluence of genres that would become his signature sound.",
        artistVerified: true,
        instagramHandle:
            'https://instagram.com/burnaboygram?igshid=NTc4MTIwNjQ2YQ=='),
    ArtisteDetails(
      artistCount: '1,700,000',
      artistName: 'Rema',
      artistAbout:
          "Nigerian singer and rapper Rema launched his career in unintentional fashion with a social media upload that prompted a contract with Mavin Records. Several commercial releases throughout 2019 (compiled as 2020's Three EP's) were highlighted by 'Dumebi,' a showcase for his soft, elastic voice. Switching his sound to something he calls Afrorave, Rema released his debut album, Rave & Roses, in 2022. It was well-received by critics and even broke into the lower reaches of the Billboard Top 200 chart. A deluxe version of the set landed in 2023, featuring his hit collaboration with Selena Gomez, 'Calm Down.'",
      artistImage:
          'https://i.guim.co.uk/img/media/c6a8e0beabfc8bd2a951fccc9122939d4943bc7b/949_804_4179_2508/master/4179.jpg?width=1020&dpr=2&s=none',
      artistFollowers: '1,000,000',
      artistRealName: 'Divine\nIkubor',
      artistAbout2:
          "Born and raised in the Edo State capital of Benin City, Rema (Divine Ikubor) grew up listening to Afrobeat and commercial rap. He formed a rap group with peers at his church, but his interest in music took an unexpected turn in February 2018, when he uploaded a clip of himself freestyling to an instrumental version of D'Prince's 'Gucci Gang.' D'Prince saw the video and got in touch, which led to Rema signing with Mavin, the Lagos-based label -- run by Don Jazzy, D'Prince's brother -- that had issued 'Gucci Gang.' Rema made his commercial debut in 2019, a year during which he released the four-track EPs Rema, Freestyle, and Bad Commando, and was featured on tracks by D'Prince, Thutmose, and Peter Maxx, as well as Mavins, a Mavin label group. 'Dumebi,' a single off the self-titled EP, fared particularly well in Nigeria and abroad.",
      artistVerified: true,
      instagramHandle: "https://instagram.com/heisrema?igshid=NTc4MTIwNjQ2YQ==",
    ),
    ArtisteDetails(
        artistCount: '1,500,000',
        artistName: 'Tems',
        artistAbout:
            "Tems is a Nigerian singer, songwriter, and producer whose thoughtful blend of alternative R&B and Afrobeat earned her international attention at the tail-end of the 2010s. After notching the 2019 hit 'Try Me,' she began to appear on high-profile tracks like WizKid's 'Essence' and Drake's 'Fountains.' Her first two EPs, 2020's For Broken Ears and 2021's If Orange Was a Place, yielded her own hits like 'Damages' and 'Found,' the latter featuring Brent Faiyaz. She was then featured on Future's Grammy Award-winning 2022 single 'Wait for U.'",
        artistImage:
            'https://hiphopwired.com/wp-content/uploads/sites/43/2022/06/16553296074388.jpg?w=1024&strip=all&quality=80',
        artistFollowers: '900,000',
        artistRealName: 'Temilade\nOpeniyi',
        artistAbout2:
            'Born in the capital city of Lagos to a Nigerian mother and British father, Temilade Openiyi spent part of her childhood in the U.K. before moving back to her home country. She nurtured her musical talent in a local choir, learning to play piano and eventually writing her own songs inspired both by classic Nigerian music and artists like Lauryn Hill and Amy Winehouse. Using the stage name Tems, she released the single "Mr. Rebel" in 2018, followed a year later by "Looku Looku" and "Try Me," the latter of which became a significant hit. 2020 proved to be a banner year for Tems with the release of her debut EP, For Broken Ears, and a number of high-profile collaborations.',
        artistVerified: true,
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '900,000',
        artistName: 'Fireboy DML',
        artistAbout:
            'Deftly mixing lush Afrobeats with R&B swagger, Nigerian singer Fireboy DML became a breakout success with the 2019 release of his debut album, Laughter, Tears and Goosebumps. Songs like "Jealous" and "Vibrations" put him on the map ahead of his 2020 follow-up, Apollo, but it was the Ed Sheeran collaboration "Peru" and its 2022 parent album, Playboy, that brought him widespread international exposure.',
        artistImage:
            'https://i0.wp.com/businesselitesafrica.com/wp-content/uploads/2023/04/Fireboy-DML-Make-it-to-Forbes-5-Things-to-Know-About-the-Afrobeat-Star.jpg?resize=1240%2C698&ssl=1',
        artistFollowers: '500,000',
        artistRealName: 'Adedamola\nAdefolahan',
        artistAbout2:
            "Born Adedamola Adefolahan in Abeokuta, Ogun State, Fireboy began taking music seriously during his university days and later signed a deal with Olamide's YBNL Nation label largely on the strength of his song 'Jealous.' The label featured it on their 2018 collaborative album YBNL Mafia Family, then re-released 'Jealous' on its own the following year. A second single, the romantic 'What If I Say' preceded the November 2019 release of Laughter, Tears and Goosebumps, which also yielded the streaming hit 'Vibrations.' The album topped the Nigerian charts, and Fireboy capitalized on his momentum by delivering a follow-up, Apollo, less than a year later.",
        artistVerified: false,
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '600,000',
        artistName: 'Asake',
        artistAbout:
            "Nigerian Afro-pop singer Asake found breakout success in 2020 with 'Lady,' an indelibly sunny track with a brisk beat and good-time vibes. Over the next two years, he built on his popularity with further hits like 'Mr. Money' and 2022's high-profile Olamide collaboration 'Omo Ope.' When his debut full-length, Mr. Money with the Vibe, arrived later that year, it reached the upper half of the Billboard 200.",
        artistImage:
            'https://www.rollingstone.com/wp-content/uploads/2023/06/Asake-Album-Review-1.jpg?w=1581&h=1054&crop=1',
        artistFollowers: '400,000',
        artistRealName: 'Ahmed\nOlolade\nAsake',
        artistAbout2:
            "Born and raised in Lagos State, Ahmed Ololade Asake studied theater and performing arts at Obafemi Awolowo University and was initially focused on dance. He began releasing music around 2018, blending bright Afrobeat rhythms with his own mix of singing and nimble freestyling. After developing his sound over early singles like 'Ayeeza' and 'Kanipe,' he released 'Lady' in 2020, which effectively launched his career. Nods from more-established tastemakers like Broda Shaggi and Tunde Ednut helped extend the song's reach, and he followed with 'Mr. Money,' which became one of his signature songs. 2021's 'Don't Hype Me' and 'Yan Yan' helped build anticipation for Ololade Asake, his 2022 debut EP. ",
        artistVerified: false,
        youtubeHandle: 'https://youtube.com/@ASAKEMUSIC',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '1,400,000',
        artistName: 'Tiwa Savage',
        artistAbout:
            "Tiwa Savage is one of the biggest pop stars to emerge from West Africa during the 2010s, with numerous hits and international awards to her name. Initially active in the music business as a backing singer and songwriter, she arrived in the early 2010s with a hybrid form of dance-pop that synthesizes Afro-pop, reggae, and contemporary R&B, singing in English and Yoruba. Already a major success by the time her debut Once Upon a Time arrived in 2013, Savage continued releasing hits throughout the following decade and expanded her global reach, performing at international festivals and venues, and appearing on the 2019 soundtrack The Lion King: The Gift. With releases like 2020's Celia and 2021's Water & Garrie EP, her sound grew to incorporate vintage Afrobeat influences, while her lyrics became more socially conscious and female empowering.",
        artistImage:
            'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcR4GRtF7lzcvjM3WxK6JsEhyAbfulurzu1aRf1EeAKEiwsR73bHJwoYe7XMZ-Ne2tvFVZtTPqXq6yv5dtk',
        artistFollowers: '900,000',
        artistRealName: 'Tiwatope\nOmolara\nSavage-Balogun',
        artistAbout2:
            "Born and raised in Lagos, Nigeria, Tiwatope Savage moved with her family to England when she was 11 years old. During the latter half of the '90s, she established herself as a background vocalist, and opted to leave the accounting world when she was sought by Mary J. Blige. Though she had a business administration degree from Kent University, she furthered her music career by attending Berklee College of Music on scholarship. Prior to her graduation, she competed on The X Factor (U.K.) during series three and made it to the final 24. During the next couple years, Savage raised her stock with additional background work, such as an appearance on Whitney Houston's I Look to You (2009), and the landing of songwriting credits on a handful of albums, including Fantasia's Grammy-nominated Back to Me.",
        artistVerified: true,
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '600,000',
        artistName: 'Ayra Starr',
        artistAbout:
            "Mixing confident, empowering lyrics with Afro-pop and silky R&B, Nigerian singer/songwriter Ayra Starr rose to national success with her 2021 debut album, 19 & Dangerous, and its chart-topping hit 'Bloody Samaritan.' Signed to Don Jazzy's influential Mavin Records label, she spent much of the next year collaborating with artists like Ladipoe, Kelly Rowland, and Magixx while issuing solo singles like 'Stars' and 'Rush.'",
        artistImage:
            "https://i0.wp.com/www.elorasblog.com/wp-content/uploads/2022/09/Screenshot_20220917-154512.jpg?w=720&ssl=1",
        artistFollowers: '400,000',
        artistRealName: "Oyinkansola\nSarah\nAderibigbe",
        artistAbout2:
            "A native of the Beninese city of Cotonou, Starr grew up in a musical family and began singing in a local church choir at age ten. Early influences ranged from 2Face Idibia and Angélique Kidjo to Shakira and Nicki Minaj. In 2018, she began modeling for the Quove agency in Lagos, Nigeria, and simultaneously releasing cover songs online. After posting an original song called 'Damage,' she was approached by label mogul Don Jazzy, who signed her to his Mavin imprint. A self-titled debut EP appeared in early 2021, introducing fans to Starr's R&B- and neo-soul-inspired Afro-pop sound and topping digital sales and streaming charts in Nigeria. Like many of her songs, its hit single 'Away' was co-written with her brother Dami. In August of that year, Mavin released Starr's debut full-length, 19 & Dangerous. A loose concept album about a Gen-Z girl coming of age, it combined Afro-pop, R&B, trap, jazz, and alté and yielded the massive hit 'Bloody Samaritan,' which hit number one on Nigeria's TurnTable Top 50 chart, making her the first female solo artist to do so. Along with her own solo tracks 'Rush' and 'Stars,' Starr spent much of 2022 collaborating with others on songs like ElGrandeToto's 'Comforter,' Skip Marley's 'Jane,' and a 'Bloody Samaritan' remix featuring Kelly Rowland.",
        artistVerified: false,
        youtubeHandle: 'https://youtube.com/@ayrastarrofficial',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '580,000',
        artistName: 'Omah Lay',
        artistAbout:
            "Stanley Omah Didia, who operates under the nom de plume Omah Lay, is a Nigerian singer and producer who emerged in 2020 with a dynamic Afrofusion sound that draws from pop, R&B, hip-hop, and highlife. He released his debut album, Boy Alone, in 2022, and earned international attention through his collaborations with Justin Bieber and Ozuna.",
        artistImage:
            "https://i0.wp.com/www.val9ja.com/wp-content/uploads/2023/06/Omah-Lay-%E2%80%93-Ripo-Ripo.jpeg?fit=1024%2C1024&ssl=1",
        artistFollowers: '500,000',
        artistRealName: 'Stanley\nOmah\nDidia',
        artistAbout2:
            "Born in the southern city of Port Harcourt, Didia spent his formative years on a marine base where his father was stationed. Music was already in the budding star's blood -- his grandfather was a drummer for '70s Igbo highlife legend Celestine Ukwu -- and by his late teens, he had traded rapping in the streets of the marine base for music production. In 2019, after finding a modicum of success writing and producing for other artists, he released a pair of his own singles, 'Do Not Disturb' and 'Hello Brother,' which caught the attention of KeyQaad. Upon inking a deal with the label, Didia relocated to Lagos, and in early 2020 he issued his debut, the sleeper hit 'You.' That track and four others appeared on his acclaimed debut EP, Get Layd, later that spring. He doubled-down on Get Layd's success with a second EP, What Have We Done, which arrived in winter and included the hits 'Godly' and 'My Bebe.' In 2021 he was featured alongside Alpha P on Masterkraft's remix of Justin Bieber's 'Peaches,' and later that year, teamed up with Bieber on the single 'Attention.' In 2022, Didia issued his first full-length outing, Boy Alone, which included 'Attention,' as well as the singles 'Understand' and 'Free My Mind.' A deluxe edition appeared in 2023, including an updated version of the album's 'Soso,' this time featuring Ozuna.",
        artistVerified: false,
        youtubeHandle: 'https://youtube.com/@OmahLay',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '400,000',
        artistName: 'Ckay',
        artistAbout:
            "Nigerian Afrobeat singer, songwriter, and producer CKay achieved breakout success in the early part of the 2020s when his single 'Love Nwantiti' became a viral hit in countries around the world. Originally released on his 2019 EP CKay the First, a remixed version featuring Joeboy and Kuami Eugene became a major hit in places like Australia, Netherlands, Norway, India, and the U.K. -- it even made the Billboard Hot 100 in the U.S. Additional remixes helped it become a hit in France, Germany, and Latin America. Amid this upswell of popularity, CKay released his debut long-player, Sad Romance, in 2022.",
        artistImage:
            'https://www.bellanaija.com/wp-content/uploads/2021/12/258896369_587177349200308_1921121892135883619_n.jpg',
        artistFollowers: '320,000',
        artistRealName: 'Chukwuka\nChukwuma\nEkweani',
        artistAbout2:
            "Born Chukwuka Ekweani in the northwestern state of Kaduna, CKay learned to play the piano from his father, who conducted the choir at their local church. After being introduced to electronic production and beatmaking, he relocated to Lagos and began releasing his own music. His smooth vocals and mix of R&B, Afrobeat, and dancehall led to a contract with influential label Chocolate City, which released his debut EP, Who the Fuck Is CKay? in September 2017. The South African-influenced 'Container' earned him some early attention, though it was his 2019 EP CKay the First that made him a star in Nigeria. After becoming a modest hit, the EP's second track, 'Love Nwantiti,' was remixed in 2020 featuring fellow Nigerian singer Joeboy and Ghanaian highlife artist Kuami Eugene under the augmented title 'Love Nwantiti (Ah Ah Ah).' In the early part of 2021, the remixed version took off, first in Nigeria, then going viral around the world, spawning additional remixes in East Africa, France, Germany, Latin America, and elsewhere. It topped the U.K. singles chart and even made it to number 80 on the Billboard Hot 100. CKay issued his third EP, Boyfriend, in 2021 and followed up with the singles 'Kiss Me Like You Miss Me' and 'Emiliana.' Sad Romance, his first full-length effort, appeared in 2022 and included guest spots from Ayra Starr, Davido, and Focalistic. CKay stayed busy in 2023 with collaborations with Ronisia ('Probleme'), Hamza ('Cocoro'), and Olamide ('Trumpet.').",
        artistVerified: false,
        youtubeHandle: 'https://youtube.com/@ckay_yo',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '6,000,000',
        artistName: 'Drake',
        artistAbout:
            "Canadian rapper and vocalist Drake sustained a high-level commercial presence shortly after he hit the scene in 2006, whether with his own chart-topping releases or a long string of guest appearances on hits by the likes of Lil Wayne, Rihanna, and A\$AP Rocky. Thanks to his introspective rap style, his sensitive R&B crooning, and his golden touch with songwriting, each one of his albums -- from 2011's Take Care to 2018's trap-influenced Scorpion -- topped charts worldwide, and singles like the Grammy-winning 'Hotline Bling' and many of his mixtapes did too. As his star rose, he helped others along, sponsoring the Weeknd's early work, starting the OVO Sound label, and giving features on his records to up-and-coming acts. By the second decade of his career, Drake's constant chart domination, his Grammy wins and nominations, and his meme-worthy cultural presence made him one of the world's most popular musicians, and the release of albums like 2022's Honestly, Nevermind became cultural events. \nKnown initially for his role as Jimmy Brooks on Degrassi: The Next Generation, the Toronto-born Aubrey Drake Graham stepped out as a rapper and singer with pop appeal in 2006, when he initiated a series of mixtapes. A year later, despite being unsigned, he scored major exposure when his cocky and laid-back track 'Replacement Girl,' featuring Trey Songz, was featured on BET's 106 & Park program as its 'Joint of the Day.' He raised his profile throughout the next several months by popping up on countless mixtapes and remixes, and as rumors swirled about contract offers from labels, he gradually became one of the most talked-about artists in the industry. It did not hurt that he had support from the likes of Kanye West, Jay-Z, and Lil Wayne.",
        artistImage:
            'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcST_Hp440wSpMUvTq3hb3OX6-rp8qJKG5nJ6CUN8MbPtN7QS9mQlY6n6QLUHe2tZF-sCISXDuN0o5a9N0k',
        artistFollowers: '4,000,000',
        artistRealName: 'Aubrey\nDrake\nGraham',
        artistAbout2:
            'Drake stayed busy throughout 2022, appearing as a guest on albums by Gunna and Future, collaborating with DJ Khaled, and signing a deal with Universal for one of the largest contracts in music business history. It took until June of that year for Drake to release any music under his own name, and when he did it was the house music-inspired Honestly, Nevermind. Though the album featured a large number of producers, most prominently Noah "40" Shebib, Black Coffee, and Carnage, the only other rapper to appear was 21 Savage. The collaboration with the latter was built out into a full-length album titled Her Loss. Released in late 2022, the record relied on trap beats, melancholy synth washes, and a surprising number of disses.',
        artistVerified: true,
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '9,000,000',
        artistName: 'Beyonce',
        artistAbout:
            "A multifaceted superstar by any measure, Beyoncé rose to fame in the late '90s as the central member of pop-R&B group Destiny's Child, and the following decade embarked on a multi-platinum, record-breaking solo career with Dangerously in Love (2003), her first in an unbroken string of number one pop solo albums. Chart-topping singles such as 'Crazy in Love' (2003), 'Irreplaceable' (2006), and 'Single Ladies (Put a Ring on It)' (2008), combined with sold-out world tours and Grammy Awards, all heightened her profile in the 2000s. Billboard named her female artist of the decade, while the RIAA acknowledged that, with 64 gold and platinum certifications, she was the decade's top-selling artist. Once Beyoncé released her self-titled visual album (2013), it was evident that the powerhouse vocalist, songwriter, and dancer wasn't merely an entertainer but a progressive artist as well. The notion was reaffirmed with her second visual album, Lemonade (2016), the Jay-Z collaboration Everything Is Love (2018), and her work on The Lion King (2019). Beyoncé expanded the latter project with the executive production of the soundtrack The Lion King: The Gift, and wrote and directed the related musical film Black Is King (2020). With Renaissance (2022), her chart-topping seventh album, Beyoncé became the most awarded artist in the history of the Grammys.",
        artistImage:
            'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcSM_RqHrSewyZbyik2DvCcItwSGEj6WJ1P3LU_Vl-5debXy9H6We_Gv6mkXJma9AFXBqY-ClodxXJNm93M',
        artistFollowers: '8,000,000',
        artistRealName: 'Beyoncé\nGiselle\nKnowles-Carter',
        artistAbout2:
            "True to form, Beyoncé issued a surprise live album, the Grammy-winning Homecoming, in April 2019. Paired with a film of the same title, the set documented her 2018 Coachella performance and added a cover of Maze's 'Before I Let Go.' Later that year, she not only starred as Nala in the photorealistic remake of The Lion King, but curated the film's accompanying soundtrack, The Lion King: The Gift. Featuring a wealth of African artists collaborating with the likes of co-star Donald Glover, Jay-Z, Pharrell Williams, Kendrick Lamar, and Tierra Whack, the album also included her single 'Spirit,' which went on to receive both Grammy and Oscar nominations. Beyoncé returned to the top of the Hot 100 in May 2020 as a featured artist on Megan Thee Stallion's 'Savage Remix.' Only two months later, she was behind the musical film Black Is King, also her third visual album. She took four awards from the subsequent Grammy ceremony: Best R&B Performance (for the Juneteenth charity single 'Black Parade'), Best Rap Song and Best Rap Performance (both for 'Savage'), and Best Music Video ('Brown Skin Girl'). Another soundtrack song, 'Be Alive,' arrived in May 2021 as part of the tennis biopic King Richard. \nIn June 2022, Beyoncé released 'Break My Soul,' a house track made with 'Single Ladies (Put a Ring on It)' collaborators the-Dream and Tricky Stewart, as the first single off her seventh studio album. The song reached the Top 20 of the Hot 100 before the late July arrival of its parent release, Renaissance. A vibrant and uptempo collection inspired in part by post-'70s Black and queer dance music, Renaissance debuted at number one and in early 2023 earned Beyoncé four more Grammy Awards, making her the most awarded artist in the organization's history.",
        artistVerified: true,
        snapHandle: 'https://www.snapchat.com/add/beyonce',
        youtubeHandle: 'https://youtube.com/@beyonce',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '4,000,000',
        artistName: '21 Savage',
        artistAbout:
            "Unflinching yet offhanded rapper 21 Savage left street life behind to establish a career that has rapidly progressed with a string of hit singles as a headliner and featured artist, the RIAA-certified gold full-lengths Savage Mode (2016), Issa Album (2017), and I Am > I Was (2018), and a clutch of Grammy Awards. Savage Mode II, his 2020 collaborative LP with Metro Boomin, topped the Billboard 200 and was a hit around the globe. He followed it in 2022 with Her Loss, another full-length collaboration, this time with Drake.",
        artistImage:
            'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcShRBzTac6NobnAdCzqDxCOUoqOi29tqWVxa7ZwZDJYQ-Bbf_lR75QIKXHp9TY5Q5jF7iVFSDZnu1hLjOQ',
        artistFollowers: '2,900,000',
        artistRealName: 'Shéyaa\nBin\nAbraham-Joseph',
        artistAbout2:
            "Between headlining releases, additional success for 21 came as a featured artist on Post Malone's \"Rockstar\" -- Grammy-nominated for Record of the Year and Best Rap/Sung Performance -- and Cardi B's 'Bartier Cardi.' A handful of other guest verses, along with contributions to the soundtracks of Uncle Drew and Superfly, followed in 2018. Near the end of the year, he released I Am > I Was, which entered the Billboard 200 at number one, supported by \"A Lot,\" another single that peaked at number 12. Grammy nominations for Rap Album of the Year and Best Rap Song followed shortly thereafter, with 'A Lot' winning Best Rap Song. 21 and Metro Boomin's sequel to Savage Mode arrived in 2020. Narrated in its entirety by actor Morgan Freeman, Savage Mode II retained the gothic mood of its predecessor and added new twists along the way. The set entered the Billboard 200 at number one. 2021 brought the EP Spiral: From the Book of Saw, a short soundtrack accompaniment to the ninth film in the Saw horror series that featured appearances by Young Nudy, Young Thug, and Gunna. Among the scattering of singles he released in 2022 was the hit 'Don\'t Play That' with King Von. Later in the year, 21 teamed up with Drake for a full collaborative album titled Her Loss.",
        artistVerified: true,
        snapHandle: 'https://www.snapchat.com/add/savage730',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '6,000,000',
        artistName: 'Kendrick Lamar',
        artistAbout:
            "Indisputably the most acclaimed rap artist of his generation, Kendrick Lamar is one of those rare MCs who has achieved critical and commercial success while earning the respect and support of those who inspired him. After several years of development, Lamar hit his creative and chart-topping stride in the 2010s. Good Kid, M.A.A.D City (2012), the Grammy-winning To Pimp a Butterfly (2015), and the Grammy- and Pulitzer Prize-winning DAMN. (2017), his three proper major-label albums, have displayed an unmatched mix of inventive wordplay and compelling conceptual narratives, examining internal conflict, flaunting success, and uplifting his community. The screenplay-level detail of Lamar's writing has been enriched by a collective of producers, instrumentalists, singers, and rappers, a high percentage of whom -- including inspirations Dr. Dre and MC Eiht, and contemporaries Sounwave and Jay Rock -- represent Lamar's native Los Angeles. Lamar's cinematic and collaborative inclinations inevitably attracted the mainstream film industry. Black Panther: The Album (2018) was the source of three of Lamar's Top Ten pop hits. In 2022 he delivered Mr. Morale & the Big Steppers, his fifth studio album and what would be his last with Top Dawg Entertainment.",
        artistImage:
            'https://hellogiggles.com/wp-content/uploads/sites/7/2018/04/17/kendrick-lamar-pulitzer-e1523975881535.jpg?quality=82&strip=1&resize=800%2C450',
        artistFollowers: '4,600,000',
        artistRealName: 'Kendrick\nLamar\nDuckworth',
        artistAbout2:
            "Led by \"HUMBLE.,\" his first number one pop hit, DAMN. arrived in April 2017 and likewise entered the Billboard 200 at the top. Remarkably, all 14 of its songs entered the Hot 100, and it was certified multi-platinum within three months. Among the contributors were Rihanna and U2, but at this point, the supporting roles were beneficial more for the guest artists than they were for Lamar, whose artistic clout was unrivaled. Lamar snagged five more Grammys. DAMN. won Best Rap Album. \"HUMBLE.\" took Best Rap Performance, Best Rap Song, and Best Video. Best Rap/Sung Performance went to \"LOYALTY,\" the Rihanna collaboration. Another number one hit followed in February 2018. The soundtrack Black Panther: The Album featured Lamar on every track. \"All the Stars\" (with SZA), \"King's Dead\" (with Jay Rock and Future) and \"Pray for Me\" (with the Weeknd), its three singles, eventually hit the Top Ten. That April, DAMN. won the Pulitzer Prize for Music. It was the first time the judges recognized a work outside the genres of classical and jazz. Months later, \"King's Dead\" made Lamar a 13-time Grammy winner. The track took the award for Best Rap Performance. \"All the Stars\" alone was nominated in four categories, while Black Panther was up for Album of the Year. The film itself was nominated for the Academy Award for Best Picture. After some time away from music that included an acting role on fifth season of the Starz network series Power, Lamar surfaced in 2021 on a series of songs with his cousin Baby Keem. Keem and Lamar's collaborative track \"Family Ties,\" released in August of 2021, won Best Rap Performance at the 2022 Grammys. In February of 2022, Lamar performed at the Super Bowl LVI half time show alongside a crew of rap royalty that included Dr. Dre, Eminem, Snoop Dogg, 50 Cent, Anderson .Paak, and Mary J. Blige. In April of that year he announced his fifth album, Mr. Morale & the Big Steppers, would be arriving the next month. In May he released a new song, \"The Heart, Pt. 5,” an installment in his ongoing series of The Heart singles that began in 2010. The accompanying video for the non-album track featured Lamar rapping as his face transformed into the likenesses of O.J. Simpson, Kobe Bryant, Nipsey Hussle, Kanye West, Will Smith, and Jussie Smollett, utilizing controversial deepfake technology. Mr. Morale & the Big Steppers was released in May of 2022 and featured guest appearances from Sampha, Kodak Black, Baby Keem, Portishead’s Beth Gibbons, and others. It was named Best Rap Album at the 65th Annual Grammy Awards in 2023, while \"The Heart, Pt. 5\" won awards for Best Rap Song and Best Rap Performance. AllMusic Quiz",
        artistVerified: false,
        youtubeHandle: 'https://youtube.com/@kendricklamar',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '7,000,000',
        artistName: 'Billie Ellish',
        artistAbout:
            'California-bred singer/songwriter Billie Eilish crafts genre-blurring outcast anthems that bridge the gap between ethereal indie electronic and dark alternative pop. With angsty, introspective lyrics that don\'t shy away from issues of mental health, she endeared herself to a devoted audience during her breakthrough years in the late 2010s when she was still just a teenager. On the heels of a sold-out headlining tour, she issued her chart-topping, Grammy-winning debut album, 2019\'s When We All Fall Asleep, Where Do We Go? In 2021, she returned to the top of the charts with her sophomore set, Happier Than Ever.',
        artistImage:
            'https://i.insider.com/5e501d3ba9f40c2c1e2c98e6?width=1000&format=jpeg&auto=webp',
        artistFollowers: '5,000,000',
        artistRealName: 'Billie Eilish\nPirate Baird\nO\'Connell',
        artistAbout2:
            'While an international tour kept Eilish on the road into 2020, she released a stand-alone single, "Everything I Wanted" -- a bittersweet reflection on her meteoric rise to fame -- and became the youngest artist to be nominated in the four major Grammy categories (Record and Song of the Year for "Bad Guy," Album of the Year, and Best New Artist). At the award ceremony in 2020, she made history by sweeping those main fields, becoming the second person -- and first since 1981 -- to pull off such a feat. On the heels of her win, Eilish premiered "No Time to Die," her theme song to the 25th James Bond film of the same name.\nLater that summer, Eilish released the R&B-washed "My Future," which became a Top Ten hit on the Hot 100. That August, her 2019 acoustic set Live at Third Man Records received wide release for Record Store Day, rising to number 55 on the Billboard 200 and topping the U.S. Vinyl Albums chart. The single "Therefore I Am" closed out the year, topping charts across the globe. Both tracks landed on her sophomore album, 2021\'s Happier Than Ever. Released in July, the set also featured "Your Power," an indictment of exploitation disguised as an acoustic ballad, and the trip-hop-inflected kiss-off "Lost Cause." With Finneas again handling production, the album unveiled a matured perspective for the artist and added fresh genres to her arsenal, from the aptly titled "Billie Bossa Nova" to the \'90s alternative rock edge of the title track. Happier Than Ever went straight to number one in the U.S., U.K., and several other territories. While on tour for the album, Eilish debuted the song "TV," which she included on her 2022 studio EP Guitar Songs.',
        artistVerified: true,
        youtubeHandle: 'https://youtube.com/@BillieEilish',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '8,000,000',
        artistName: 'Justin Bieber',
        artistAbout:
            "Justin Bieber became a global pop phenomenon with his debut, My World (2009), a multi-platinum smash in the singer's native Canada and several other territories. Only 15 years old at the time of its release, Bieber was fast-tracked to sustained commercial presence with a remix compilation, an acoustic set, a concert film, and additional studio recordings, including the Grammy-nominated My World 2.0 (2010) and similarly chart-topping Believe (2012), all hitting the market within a three-year period. Bieber's progress ground to a halt, but he re-emerged with the \"tropical house\"-flavored Skrillex and Diplo collaboration \"Where Are Ü Now\" (2015), a Grammy winner in the dance field, and third proper album Purpose (also 2015), which led to four nominations from Recording Academy voters. By the end of the 2010s, Bieber had added to his hits as a featured artist with a remix of Luis Fonsi and Daddy Yankee's \"Despacito,\" DJ Khaled's \"I'm the One\" and \"No Brainer,\" David Guetta's \"2U,\" Ed Sheeran's \"I Don't Care,\" and Dan + Shay's Grammy-winning \"10,000 Hours.\" Bieber's evolution as an R&B-inspired, stylistically flexible pop artist has continued with Changes (2020) and Justice (2021), which have kept his streak of chart-topping albums intact.",
        artistImage:
            'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1240w,f_auto,q_auto:best/newscms/2020_45/1628744/justin-bieber-kb-main-201102.jpg',
        artistFollowers: '6,500,000',
        artistRealName: 'Justin\nDrew\nBieber',
        artistAbout2:
            'Also preceded by the first installments of his Seasons documentary and the headlining singles "Yummy" and "Intentions" -- eventual Top Ten hits in Canada and the U.S. -- Changes arrived in February 2020 and continued his streak of number one albums in Canada and the U.S. Hits as a lead artist, co-headliner, and featured guest kept coming. Bieber was behind four subsequent 2020 singles that topped the Canadian pop chart: "Stuck with U" (a duet with Ariana Grande), "Holy" (featuring Chance the Rapper), "Lonely" (with Benny Blanco), and "Monster" (a duet with Shawn Mendes). He was up for four Grammys handed out in March 2021, nominated for Best Pop Vocal Album (Changes), Best Pop Solo Performance ("Yummy"), and Best Pop/Duo Performance ("Intentions"), while he and Dan + Shay took the award for Best Country Duo/Group Performance ("10,000 Hours"). By the time Bieber issued Justice later in March, he had another pair of Top Ten Canadian hits with "Anyone" and "Hold On." Justice, like Bieber\'s five previous proper albums, topped the Canadian and U.S. charts. After its release, he turned to collaborations, guesting on "Wandered to L.A.," a posthumous Juice WRLD track. and teaming back up with Don Toliver for 2022\'s "Honest."',
        artistVerified: true,
        snapHandle: 'https://www.snapchat.com/add/rickthesizzler',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '8,500,000',
        artistName: "Selena Gomez",
        artistAbout:
            "Selena Gomez is a multi-talented performer with featured roles on the screen, both small and big, and a musical career that reached the summit of the charts from the very beginning and stayed planted there for many years. Her group Selena Gomez & the Scene issued a trio of breezy modern pop albums from 2009 to 2011 that each hit the Top Ten. After going solo, she scored a pair of number ones with the more adult-oriented Stars Dance (2013) and Revival (2015), then branched out into new sounds on collaborations with Kygo (\"It Ain't Me\") and Marshmello (\"Wolves\"). Gomez reached the top of the singles chart for the first time with \"Lose You to Love Me\" (2019), a soul-searching ballad that delved into her real-life relationships and marked a new openness in her lyrical approach. In 2021, she took on Latin pop for the first time with the Revelación EP. Along with her starring role in Hulu's Only Murders in the Building, she was also the subject of the candid 2022 documentary Selena Gomez: My Mind & Me.",
        artistImage:
            'https://www.iwmbuzz.com/wp-content/uploads/2020/12/selena-gomez-speaks-about-her-new-upcoming-album-of-2021-says-a-whole-little-vessel-of-good-things-coming-920x518.jpg',
        artistFollowers: '8,200,000',
        artistRealName: 'Selena\nMarie\nGomez',
        artistAbout2:
            "The song set the tone for her sixth album, Rare, a collection of tracks that explored aspects of Gomez's life in ways her previous work hadn't. It featured the usual crop of heavy-hitters behind the scenes, including Mattman & Robin, Justin Tranter, and Julia Michaels, and entered the Billboard 200 at number one in January 2020. The following year saw Gomez issue her first full-length Spanish-language project, the Grammy-nominated Revelación EP, which featured contributions from DJ Snake, Myke Towers, and Rauw Alejandro.\nIn 2021, she began starring in the Hulu mystery-comedy show Only Murders in the Building with Steve Martin and Martin Short. She was also the subject of director Alek Keshishian's 2022 documentary Selena Gomez: My Mind & Me. The film followed Gomez over a six-year period and detailed her struggles with fame, as well as her physical and mental health issues in the wake of being diagnosed with lupus bipolar disorder. As part of the documentary, she released the single \"My Mind & Me.\"",
        artistVerified: true,
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '6,500,000',
        artistName: 'Nicki Minaj',
        artistAbout:
            "Nicki Minaj skyrocketed from mixtape phenom to pop star with a unique combination of ferocity and humor she continues to flaunt with razor-sharp wordplay, mercilessly blunt lyricism, and a vocal style that turns on a dime from sugary to snarling. The rapper's early days included attempts at an acting career and losing her job at Red Lobster for being rude to customers, but she progressed quickly from MySpace demos to nationally adored mixtapes to household-name status. Pink Friday, Minaj's 2010 album debut, saw her appeal to a broader audience with chart-topping reception. Although she has had similar success with later full-lengths such as 2014's The Pinkprint and 2018's Queen, her singles have made an even greater impact. In just over a decade, Minaj has hit the Top 40 over two dozen times as a headliner with singles such as \"Super Bass,\" \"Starships,\" and \"Anaconda.\" These and other highlights were gathered in 2022 for Queen Radio, Vol. 1, an anthology containing the number one hit \"Super Freaky Girl\" among its new songs. Her Top 40 entries as a featured artist are even more numerous and include Kanye West's \"Monster,\" David Guetta's \"Turn Me On,\" and Ariana Grande's \"Side to Side.\"",
        artistImage:
            'https://www.vibe.com/wp-content/uploads/2023/07/GettyImages-1529636950-e1689004214648.jpeg?w=910&h=511&crop=1&resize=1440%2C810',
        artistFollowers: '5,000,000',
        artistRealName: 'Onika Tanya\nMaraj-Petty',
        artistAbout2:
            'She returned with the singles "Chun-Li" and "Barbie Tingz" in spring 2018, paving the way for her fourth studio album, Queen, which arrived in August of that year. In addition to third single "Bed" featuring Ariana Grande, the LP also features guests Labrinth, Eminem, Lil Wayne, the Weeknd, Future, Foxy Brown, and Swae Lee. Upon release, Queen matched its predecessor with a number two debut on the Billboard 200. More singles arrived the following year, including the non-album track "Megatron," "Tusa" with Karol G, "Trollz" with 6ix9ine. Minaj was also featured alongside Murda Beatz on PnB Rock 2019 track "Fendi." In February 2020, the rapper returned with her own stand-alone song "Yikes." Minaj\'s third mixtape Beam Me Up Scotty was reissued in 2021, eleven years after its original release. The project was given new cover art and the track listing was altered somewhat, omitting some of the songs from the original 2009 release and including several new tracks. This new version of Minaj\'s breakout project debuted in the number two spot on the Billboard 200, making it the highest-charting mixtape from a female rapper up to that point.\nThroughout the early 2020s, Minaj continued her usual bevy of guest features and collaborations, appearing on tracks by Doja Cat, former Little Mix vocalist Jesy Nelson, BIA, and Elton John. In 2022, she scored more hits as a lead artist with the Lil Baby collaborations "Do We Have a Problem?" and "Bussin," then topped the pop chart with "Super Freaky Girl." All three of these singles were included on Queen Radio, Vol. 1, a celebratory anthology released that August. Minaj kicked off 2023 with the flamenco- and trap-inspired "Red Ruby da Sleeze," which she followed with a feature on YoungBoy Never Broke Again\'s "WTF."',
        artistVerified: true,
        instagramHandle:
            'https://instagram.com/nickiminaj?igshid=NTc4MTIwNjQ2YQ==',
        youtubeHandle: 'https://youtube.com/@nickiminaj'),
    ArtisteDetails(
        artistCount: '7,000,000',
        artistName: 'Cardi B',
        artistAbout:
            "Rapper and entertainer Cardi B made her debut in the late 2010s with a quick ascent to the top of the rap and pop charts. After an initial run of singles that crowned her the first female rapper in nearly two decades to top the Billboard Hot 100 (with \"Bodak Yellow\"), she issued her critically acclaimed debut album, 2018's Invasion of Privacy, which reached number one and broke additional records with the summer smash \"I Like It.\" Capping off her whirlwind breakthrough era, she became the first solo female rapper to win a Grammy for Best Rap Album. Heading into the next decade, Cardi continued to dominate with chart-topping singles like 2020's \"WAP\" with Megan Thee Stallion and 2021's \"Up.\"",
        artistImage:
            'https://b3085025.smushcdn.com/3085025/wp-content/uploads/2022/02/cardi-b.jpg?lossy=1&strip=1&webp=1',
        artistFollowers: '5,000,000',
        artistRealName: 'Belcalis\nMarlenis Almánzar\nCephus',
        artistAbout2:
            'Her official debut studio album, Invasion of Privacy, arrived in spring 2018. Including her two breakthrough singles, the effort also featured appearances by Migos ("Drip"), Chance the Rapper ("Best Life"), Kehlani ("Ring"), SZA ("I Do"), YG ("She Bad"), and Bad Bunny and J. Balvin on "I Like It." The latter track was issued as a single and made a steady climb to the top of the Hot 100 in July 2018, making Cardi the first female rapper to achieve two number ones. That summer, she was also featured on hit singles with Jennifer Lopez ("Dinero") and Maroon 5 ("Girls Like You"). To cap her banner year, she was nominated for multiple Grammy Awards and Invasion of Privacy was included on numerous year-end critics\' lists. The album went on to win a Grammy for Best Rap Album, making Cardi the first solo female rapper to achieve the honor. The next year, she was nominated again in the category of Best Rap Performance for her Offset collaboration "Clout." In August 2020, she topped the Billboard Hot 100 singles chart with the song "WAP," a collaboration with Megan Thee Stallion. Six months later, Cardi landed another smash hit with 2021\'s "Up," a drill-inspired solo single that earned global success and topped four different Billboard charts. That same year she contributed to hits by Normani ("Wild Side") and Lizzo ("Rumors") before returning in 2022 with the Kanye West and Lil Durk collaboration "Hot Shit."',
        artistVerified: true,
        snapHandle: 'https://www.snapchat.com/add/iamcardib',
        instagramHandle: null),
    ArtisteDetails(
        artistCount: '6,000,000',
        artistName: "Chris Brown",
        artistAbout:
            "Greeted with comparisons to a young Michael Jackson and Usher, Chris Brown arrived in 2005 as a squeaky-clean pop-R&B artist with \"Run It!,\" the first debut single by a male artist to top the Billboard Hot 100 in over a decade. While there was nowhere to go but down, at least in terms of chart positions, the singer, dancer, and occasional rapper was only getting started. Within a few years, Brown became one of the biggest active pop stars with Chris Brown (2005) and Exclusive (2007), multi-platinum albums that produced five more Top Ten singles, including \"Kiss Kiss\" and \"Forever.\" As a featured artist or duettist, he added to the count with hits such as \"No Air,\" a ballad with Jordin Sparks. By the end of the decade, Brown underwent a stylistic makeover during which his forebears shifted to the likes of Jodeci, R. Kelly, and 2Pac. This, and a more drastic change in his public image, did little to slow his commercial momentum. His streak of Top Ten albums was sustained with releases such as Graffiti (2009), the Grammy-winning F.A.M.E. (2011), and Fortune (2012). Brown's artistic scope has since continued to widen with Heartbreak on a Full Moon (2017) and Indigo (2019), albums as long as epic films, and Breezy (2022), his tenth consecutive Top Ten solo LP. \"Summer Too Hot,\" the first single from his next project, appeared in 2023.",
        artistImage:
            "https://www.billboard.com/wp-content/uploads/media/chris-brown-5-live-2017-billboard-1548.jpg?w=942&h=623&crop=1",
        artistFollowers: '4,500,000',
        artistRealName: 'Christopher\nMaurice\nBrown',
        artistAbout2:
            'Brown cranked out material in larger volumes and made more featured appearances through the end of the 2010s. Heartbreak on a Full Moon arrived in October 2017 with 45 songs on its deluxe edition. It entered the Billboard 200 at number three, making it the artist\'s eighth consecutive Top Ten album. The following year, Brown appeared on a few high-profile collaborative singles, highlighted by Lil Dicky\'s "Freaky Friday," another Top Ten hit. In June 2019, Brown returned with his ninth solo album, the chart-topping double-length Indigo. A track from the LP, "No Guidance," was nominated for a Grammy for Best R&B Song. The commercial mixtape Slime & B, a collaboration with Young Thug, followed in May 2020 and hit number 24 on the Billboard 200. Brown returned in June 2022 with the number four hit Breezy. Aiming to relate more directly to the women in his audience with an emphasis on slow jams and ballads, he also added the likes of Ella Mai and H.E.R. to a supporting cast that included WizKid, Jack Harlow, and Lil Durk. Despite the LP\'s many guests, the unassisted "Iffy" and "WE (Warm Embrace)" were its two first singles to hit the Hot 100. Brown stayed busy in 2023, teaming up with Fridayy on the R&B anthem "Don\'t Give It Away," appearing on Chlöe Bailey\'s "How Does It Feel," and giving fans a sneak peek at his forthcoming 11th long-player with the breezy "Summer Too Hot."',
        artistVerified: true,
        instagramHandle:
            'https://instagram.com/chrisbrownofficial?igshid=NTc4MTIwNjQ2YQ==')
  ];

  int artistPicker() {
    Random random = Random();
    int randomNumber = random
        .nextInt(listLength()); // Generate a random number between 0 and 3
    return randomNumber;
  }
}

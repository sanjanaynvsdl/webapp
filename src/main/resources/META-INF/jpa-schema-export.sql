
    drop table if exists Application CASCADE ;

    drop table if exists Application_literacySkills CASCADE ;

    drop table if exists Application_numeracySkills CASCADE ;

    drop table if exists ApplicationVersion CASCADE ;

    drop table if exists Audio CASCADE ;

    drop table if exists Audio_Letter CASCADE ;

    drop table if exists Audio_literacySkills CASCADE ;

    drop table if exists Audio_Number CASCADE ;

    drop table if exists Audio_numeracySkills CASCADE ;

    drop table if exists Audio_Word CASCADE ;

    drop table if exists AudioContributionEvent CASCADE ;

    drop table if exists AudioPeerReviewEvent CASCADE ;

    drop table if exists Contributor CASCADE ;

    drop table if exists Contributor_roles CASCADE ;

    drop table if exists DbMigration CASCADE ;

    drop table if exists Device CASCADE ;

    drop table if exists Emoji CASCADE ;

    drop table if exists Emoji_Word CASCADE ;

    drop table if exists Image CASCADE ;

    drop table if exists Image_Letter CASCADE ;

    drop table if exists Image_literacySkills CASCADE ;

    drop table if exists Image_Number CASCADE ;

    drop table if exists Image_numeracySkills CASCADE ;

    drop table if exists Image_Word CASCADE ;

    drop table if exists ImageContributionEvent CASCADE ;

    drop table if exists Letter CASCADE ;

    drop table if exists LetterContributionEvent CASCADE ;

    drop table if exists LetterLearningEvent CASCADE ;

    drop table if exists LetterSoundCorrespondence CASCADE ;

    drop table if exists LetterSoundCorrespondence_Letter CASCADE ;

    drop table if exists LetterSoundCorrespondence_Sound CASCADE ;

    drop table if exists LetterSoundCorrespondenceContributionEvent CASCADE ;

    drop table if exists Number CASCADE ;

    drop table if exists Number_Word CASCADE ;

    drop table if exists NumberContributionEvent CASCADE ;

    drop table if exists Sound CASCADE ;

    drop table if exists StoryBook CASCADE ;

    drop table if exists StoryBookChapter CASCADE ;

    drop table if exists StoryBookContributionEvent CASCADE ;

    drop table if exists StoryBookLearningEvent CASCADE ;

    drop table if exists StoryBookParagraph CASCADE ;

    drop table if exists StoryBookParagraph_Word CASCADE ;

    drop table if exists StoryBookPeerReviewEvent CASCADE ;

    drop table if exists Syllable CASCADE ;

    drop table if exists Syllable_Sound CASCADE ;

    drop table if exists Video CASCADE ;

    drop table if exists Video_Letter CASCADE ;

    drop table if exists Video_literacySkills CASCADE ;

    drop table if exists Video_Number CASCADE ;

    drop table if exists Video_numeracySkills CASCADE ;

    drop table if exists Video_Word CASCADE ;

    drop table if exists Word CASCADE ;

    drop table if exists Word_LetterSoundCorrespondence CASCADE ;

    drop table if exists WordContributionEvent CASCADE ;

    drop table if exists WordLearningEvent CASCADE ;

    drop table if exists WordPeerReviewEvent CASCADE ;

    create table Application (
       id bigint generated by default as identity (start with 1),
        applicationStatus varchar(255),
        infrastructural boolean not null,
        packageName varchar(255),
        contributor_id bigint,
        primary key (id)
    );

    create table Application_literacySkills (
       Application_id bigint not null,
        literacySkills varchar(255)
    );

    create table Application_numeracySkills (
       Application_id bigint not null,
        numeracySkills varchar(255)
    );

    create table ApplicationVersion (
       id bigint generated by default as identity (start with 1),
        bytes blob(1073741824),
        checksumMd5 varchar(255),
        contentType varchar(255),
        fileSizeInKb integer,
        icon blob(512000),
        label varchar(255),
        minSdkVersion integer,
        timeUploaded timestamp,
        versionCode integer,
        versionName varchar(255),
        application_id bigint,
        contributor_id bigint,
        primary key (id)
    );

    create table Audio (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        attributionUrl varchar(1000),
        contentLicense varchar(255),
        contentType varchar(255),
        audioFormat varchar(255),
        bytes blob(209715200),
        durationMs bigint,
        title varchar(255),
        transcription varchar(255),
        storyBookParagraph_id bigint,
        word_id bigint,
        primary key (id)
    );

    create table Audio_Letter (
       Audio_id bigint not null,
        letters_id bigint not null,
        primary key (Audio_id, letters_id)
    );

    create table Audio_literacySkills (
       Audio_id bigint not null,
        literacySkills varchar(255)
    );

    create table Audio_Number (
       Audio_id bigint not null,
        numbers_id bigint not null,
        primary key (Audio_id, numbers_id)
    );

    create table Audio_numeracySkills (
       Audio_id bigint not null,
        numeracySkills varchar(255)
    );

    create table Audio_Word (
       Audio_id bigint not null,
        words_id bigint not null,
        primary key (Audio_id, words_id)
    );

    create table AudioContributionEvent (
       id bigint generated by default as identity (start with 1),
        comment varchar(1000),
        platform varchar(255),
        revisionNumber integer,
        time timestamp,
        timeSpentMs bigint,
        contributor_id bigint,
        audio_id bigint,
        primary key (id)
    );

    create table AudioPeerReviewEvent (
       id bigint generated by default as identity (start with 1),
        approved boolean,
        comment varchar(1000),
        platform varchar(255),
        time timestamp,
        contributor_id bigint,
        audioContributionEvent_id bigint,
        primary key (id)
    );

    create table Contributor (
       id bigint generated by default as identity (start with 1),
        email varchar(255),
        firstName varchar(255),
        imageUrl varchar(255),
        lastName varchar(255),
        motivation varchar(1000),
        occupation varchar(255),
        providerIdGitHub varchar(255),
        providerIdGoogle varchar(255),
        providerIdWeb3 varchar(42),
        registrationTime timestamp,
        usernameGitHub varchar(255),
        primary key (id)
    );

    create table Contributor_roles (
       Contributor_id bigint not null,
        roles varchar(255)
    );

    create table DbMigration (
       id bigint generated by default as identity (start with 1),
        calendar timestamp,
        script varchar(10000),
        version integer,
        primary key (id)
    );

    create table Device (
       id bigint generated by default as identity (start with 1),
        deviceId varchar(255),
        deviceManufacturer varchar(255),
        deviceModel varchar(255),
        deviceSerial varchar(255),
        osVersion integer,
        remoteAddress varchar(255),
        timeRegistered timestamp,
        primary key (id)
    );

    create table Emoji (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        glyph varchar(4),
        unicodeEmojiVersion double,
        unicodeVersion double,
        primary key (id)
    );

    create table Emoji_Word (
       Emoji_id bigint not null,
        words_id bigint not null,
        primary key (Emoji_id, words_id)
    );

    create table Image (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        attributionUrl varchar(1000),
        contentLicense varchar(255),
        contentType varchar(255),
        bytes blob(10485760),
        dominantColor varchar(255),
        imageFormat varchar(255),
        title varchar(255),
        primary key (id)
    );

    create table Image_Letter (
       Image_id bigint not null,
        letters_id bigint not null,
        primary key (Image_id, letters_id)
    );

    create table Image_literacySkills (
       Image_id bigint not null,
        literacySkills varchar(255)
    );

    create table Image_Number (
       Image_id bigint not null,
        numbers_id bigint not null,
        primary key (Image_id, numbers_id)
    );

    create table Image_numeracySkills (
       Image_id bigint not null,
        numeracySkills varchar(255)
    );

    create table Image_Word (
       Image_id bigint not null,
        words_id bigint not null,
        primary key (Image_id, words_id)
    );

    create table ImageContributionEvent (
       id bigint generated by default as identity (start with 1),
        comment varchar(1000),
        platform varchar(255),
        revisionNumber integer,
        time timestamp,
        timeSpentMs bigint,
        contributor_id bigint,
        image_id bigint,
        primary key (id)
    );

    create table Letter (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        diacritic boolean not null,
        text varchar(1),
        primary key (id)
    );

    create table LetterContributionEvent (
       id bigint generated by default as identity (start with 1),
        comment varchar(1000),
        platform varchar(255),
        revisionNumber integer,
        time timestamp,
        timeSpentMs bigint,
        contributor_id bigint,
        letter_id bigint,
        primary key (id)
    );

    create table LetterLearningEvent (
       id bigint generated by default as identity (start with 1),
        androidId varchar(255),
        learningEventType varchar(255),
        packageName varchar(255),
        time timestamp,
        letterText varchar(255),
        application_id bigint,
        letter_id bigint,
        primary key (id)
    );

    create table LetterSoundCorrespondence (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        primary key (id)
    );

    create table LetterSoundCorrespondence_Letter (
       LetterSoundCorrespondence_id bigint not null,
        letters_id bigint not null,
        letters_ORDER integer not null,
        primary key (LetterSoundCorrespondence_id, letters_ORDER)
    );

    create table LetterSoundCorrespondence_Sound (
       LetterSoundCorrespondence_id bigint not null,
        sounds_id bigint not null,
        sounds_ORDER integer not null,
        primary key (LetterSoundCorrespondence_id, sounds_ORDER)
    );

    create table LetterSoundCorrespondenceContributionEvent (
       id bigint generated by default as identity (start with 1),
        comment varchar(1000),
        platform varchar(255),
        revisionNumber integer,
        time timestamp,
        timeSpentMs bigint,
        contributor_id bigint,
        letterSoundCorrespondence_id bigint,
        primary key (id)
    );

    create table Number (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        symbol varchar(255),
        value integer,
        primary key (id)
    );

    create table Number_Word (
       Number_id bigint not null,
        words_id bigint not null,
        words_ORDER integer not null,
        primary key (Number_id, words_ORDER)
    );

    create table NumberContributionEvent (
       id bigint generated by default as identity (start with 1),
        comment varchar(1000),
        platform varchar(255),
        revisionNumber integer,
        time timestamp,
        timeSpentMs bigint,
        contributor_id bigint,
        number_id bigint,
        primary key (id)
    );

    create table Sound (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        consonantPlace varchar(255),
        consonantType varchar(255),
        consonantVoicing varchar(255),
        diacritic boolean not null,
        lipRounding varchar(255),
        soundType varchar(255),
        valueIpa varchar(3),
        valueSampa varchar(5),
        vowelFrontness varchar(255),
        vowelHeight varchar(255),
        vowelLength varchar(255),
        audio_id bigint,
        primary key (id)
    );

    create table StoryBook (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        attributionUrl varchar(1000),
        contentLicense varchar(255),
        description varchar(1024),
        readingLevel varchar(255),
        title varchar(255),
        coverImage_id bigint,
        primary key (id)
    );

    create table StoryBookChapter (
       id bigint generated by default as identity (start with 1),
        sortOrder integer,
        image_id bigint,
        storyBook_id bigint,
        primary key (id)
    );

    create table StoryBookContributionEvent (
       id bigint generated by default as identity (start with 1),
        comment varchar(1000),
        platform varchar(255),
        revisionNumber integer,
        time timestamp,
        timeSpentMs bigint,
        paragraphTextAfter varchar(1000),
        paragraphTextBefore varchar(1000),
        contributor_id bigint,
        storyBook_id bigint,
        primary key (id)
    );

    create table StoryBookLearningEvent (
       id bigint generated by default as identity (start with 1),
        androidId varchar(255),
        learningEventType varchar(255),
        packageName varchar(255),
        time timestamp,
        storyBookId bigint,
        storyBookTitle varchar(255),
        application_id bigint,
        storyBook_id bigint,
        primary key (id)
    );

    create table StoryBookParagraph (
       id bigint generated by default as identity (start with 1),
        originalText varchar(1024),
        sortOrder integer,
        storyBookChapter_id bigint,
        primary key (id)
    );

    create table StoryBookParagraph_Word (
       StoryBookParagraph_id bigint not null,
        words_id bigint not null,
        words_ORDER integer not null,
        primary key (StoryBookParagraph_id, words_ORDER)
    );

    create table StoryBookPeerReviewEvent (
       id bigint generated by default as identity (start with 1),
        approved boolean,
        comment varchar(1000),
        platform varchar(255),
        time timestamp,
        contributor_id bigint,
        storyBookContributionEvent_id bigint,
        primary key (id)
    );

    create table Syllable (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        text varchar(255),
        primary key (id)
    );

    create table Syllable_Sound (
       Syllable_id bigint not null,
        sounds_id bigint not null,
        sounds_ORDER integer not null,
        primary key (Syllable_id, sounds_ORDER)
    );

    create table Video (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        attributionUrl varchar(1000),
        contentLicense varchar(255),
        contentType varchar(255),
        bytes blob(209715200),
        thumbnail blob(1048576),
        title varchar(255),
        videoFormat varchar(255),
        primary key (id)
    );

    create table Video_Letter (
       Video_id bigint not null,
        letters_id bigint not null,
        primary key (Video_id, letters_id)
    );

    create table Video_literacySkills (
       Video_id bigint not null,
        literacySkills varchar(255)
    );

    create table Video_Number (
       Video_id bigint not null,
        numbers_id bigint not null,
        primary key (Video_id, numbers_id)
    );

    create table Video_numeracySkills (
       Video_id bigint not null,
        numeracySkills varchar(255)
    );

    create table Video_Word (
       Video_id bigint not null,
        words_id bigint not null,
        primary key (Video_id, words_id)
    );

    create table Word (
       id bigint generated by default as identity (start with 1),
        contentStatus varchar(255),
        peerReviewStatus varchar(255),
        revisionNumber integer,
        timeLastUpdate timestamp,
        usageCount integer,
        spellingConsistency varchar(255),
        text varchar(255),
        wordType varchar(255),
        rootWord_id bigint,
        primary key (id)
    );

    create table Word_LetterSoundCorrespondence (
       Word_id bigint not null,
        letterSoundCorrespondences_id bigint not null,
        letterSoundCorrespondences_ORDER integer not null,
        primary key (Word_id, letterSoundCorrespondences_ORDER)
    );

    create table WordContributionEvent (
       id bigint generated by default as identity (start with 1),
        comment varchar(1000),
        platform varchar(255),
        revisionNumber integer,
        time timestamp,
        timeSpentMs bigint,
        contributor_id bigint,
        word_id bigint,
        primary key (id)
    );

    create table WordLearningEvent (
       id bigint generated by default as identity (start with 1),
        androidId varchar(255),
        learningEventType varchar(255),
        packageName varchar(255),
        time timestamp,
        wordText varchar(255),
        application_id bigint,
        word_id bigint,
        primary key (id)
    );

    create table WordPeerReviewEvent (
       id bigint generated by default as identity (start with 1),
        approved boolean,
        comment varchar(1000),
        platform varchar(255),
        time timestamp,
        contributor_id bigint,
        wordContributionEvent_id bigint,
        primary key (id)
    );

    alter table Contributor 
       add constraint UK_se15thb3bqtr3sw28rgf1v8ia unique (email);

    alter table Contributor 
       add constraint UK_g3my0evexejqgidmkse6suxt3 unique (providerIdWeb3);

    alter table DbMigration 
       add constraint UK_gdl53lyf9qvi56fmbrk9nfrg9 unique (version);

    alter table Device 
       add constraint UK_ktkbd0xm3q2nddw1xxtdaxjy7 unique (deviceId);

    alter table Application 
       add constraint FKn1pft600om9qs7dn754chjk67 
       foreign key (contributor_id) 
       references Contributor;

    alter table Application_literacySkills 
       add constraint FK6m0x1m1hks48tio7hdlcyumqq 
       foreign key (Application_id) 
       references Application;

    alter table Application_numeracySkills 
       add constraint FK858mh1kg9x9w8oqip0mkf53tr 
       foreign key (Application_id) 
       references Application;

    alter table ApplicationVersion 
       add constraint FKf2y9evfvnfd82cot9dhk0ue54 
       foreign key (application_id) 
       references Application;

    alter table ApplicationVersion 
       add constraint FKbmfakjprck5g1jlh74xpmp0j7 
       foreign key (contributor_id) 
       references Contributor;

    alter table Audio 
       add constraint FKohdvhlrrancsjct22f3y0os89 
       foreign key (storyBookParagraph_id) 
       references StoryBookParagraph;

    alter table Audio 
       add constraint FK1bkjicci0k63irniwg0fm9ans 
       foreign key (word_id) 
       references Word;

    alter table Audio_Letter 
       add constraint FKqjf1gijq56ob68ug5048bfaci 
       foreign key (letters_id) 
       references Letter;

    alter table Audio_Letter 
       add constraint FKsqpvtu98kcwp9mr75fh8eulf9 
       foreign key (Audio_id) 
       references Audio;

    alter table Audio_literacySkills 
       add constraint FKrch8svr2vr7vf2v9ojyh6326r 
       foreign key (Audio_id) 
       references Audio;

    alter table Audio_Number 
       add constraint FKyr69l8fg58o8ia369q106l5q 
       foreign key (numbers_id) 
       references Number;

    alter table Audio_Number 
       add constraint FK9wkeuh81ec6supbcr70yvo73k 
       foreign key (Audio_id) 
       references Audio;

    alter table Audio_numeracySkills 
       add constraint FKi8d6h9e6l39hll19wng6p32lp 
       foreign key (Audio_id) 
       references Audio;

    alter table Audio_Word 
       add constraint FKq2afgtopap8nf5xmahk0rvo6 
       foreign key (words_id) 
       references Word;

    alter table Audio_Word 
       add constraint FKdt7dvkfoa2ne8ssgtq44s3yte 
       foreign key (Audio_id) 
       references Audio;

    alter table AudioContributionEvent 
       add constraint FKk5x3wa0d4qp54r94o7tky3mrt 
       foreign key (contributor_id) 
       references Contributor;

    alter table AudioContributionEvent 
       add constraint FKspea1r50sj31ovaw0cmsrdd1t 
       foreign key (audio_id) 
       references Audio;

    alter table AudioPeerReviewEvent 
       add constraint FKqacw1s4ljilnjcjp5ldqtbjti 
       foreign key (contributor_id) 
       references Contributor;

    alter table AudioPeerReviewEvent 
       add constraint FK9750pa9ak23p1y0lwft00vkch 
       foreign key (audioContributionEvent_id) 
       references AudioContributionEvent;

    alter table Contributor_roles 
       add constraint FKriv03x8alxet23b7b4ivk2vot 
       foreign key (Contributor_id) 
       references Contributor;

    alter table Emoji_Word 
       add constraint FKbkw2j0k8qfhx43docakb9j5ve 
       foreign key (words_id) 
       references Word;

    alter table Emoji_Word 
       add constraint FKlwplucw359d2d5i4yelfkwy6f 
       foreign key (Emoji_id) 
       references Emoji;

    alter table Image_Letter 
       add constraint FK9pi4lblfl1s807tlif82cm5mt 
       foreign key (letters_id) 
       references Letter;

    alter table Image_Letter 
       add constraint FK4gkpmcffc4upm7mrudt4clux4 
       foreign key (Image_id) 
       references Image;

    alter table Image_literacySkills 
       add constraint FKase42u556a5hkq1qau359sohp 
       foreign key (Image_id) 
       references Image;

    alter table Image_Number 
       add constraint FKitwj5vppcji5now11mp8icipa 
       foreign key (numbers_id) 
       references Number;

    alter table Image_Number 
       add constraint FK70i88cwc0frkrx6lo2hjuav4v 
       foreign key (Image_id) 
       references Image;

    alter table Image_numeracySkills 
       add constraint FKlsmoxnf75p3c9bsstqxjy39cx 
       foreign key (Image_id) 
       references Image;

    alter table Image_Word 
       add constraint FKo4boxy1gphgg94k7gsyyf2gkh 
       foreign key (words_id) 
       references Word;

    alter table Image_Word 
       add constraint FKm6hxhjn1og47ovf4xyt6uaqff 
       foreign key (Image_id) 
       references Image;

    alter table ImageContributionEvent 
       add constraint FKlw0g62yxana6js9f7hpc4hybc 
       foreign key (contributor_id) 
       references Contributor;

    alter table ImageContributionEvent 
       add constraint FK9v3p0869ivi1jeohpkn8sttr0 
       foreign key (image_id) 
       references Image;

    alter table LetterContributionEvent 
       add constraint FKrrosmtv3fcec9acjayfruop5 
       foreign key (contributor_id) 
       references Contributor;

    alter table LetterContributionEvent 
       add constraint FK5do5q62aj1bilg8pwmphr4ugl 
       foreign key (letter_id) 
       references Letter;

    alter table LetterLearningEvent 
       add constraint FKbgt0ocoif6wvshp6lyasfdmq7 
       foreign key (application_id) 
       references Application;

    alter table LetterLearningEvent 
       add constraint FKfheqcx945pkedcq0vnlcuayct 
       foreign key (letter_id) 
       references Letter;

    alter table LetterSoundCorrespondence_Letter 
       add constraint FKhiri2loopmprnhud2jiu639ue 
       foreign key (letters_id) 
       references Letter;

    alter table LetterSoundCorrespondence_Letter 
       add constraint FKe8u07ekjdxhvqqfxclsloax4a 
       foreign key (LetterSoundCorrespondence_id) 
       references LetterSoundCorrespondence;

    alter table LetterSoundCorrespondence_Sound 
       add constraint FKogybx13b6mfullxvgs9ienb9v 
       foreign key (sounds_id) 
       references Sound;

    alter table LetterSoundCorrespondence_Sound 
       add constraint FKt96gcgkuh6ho034lfjbgu5j79 
       foreign key (LetterSoundCorrespondence_id) 
       references LetterSoundCorrespondence;

    alter table LetterSoundCorrespondenceContributionEvent 
       add constraint FKouellxtx1de1wpddv5x72h9jn 
       foreign key (contributor_id) 
       references Contributor;

    alter table LetterSoundCorrespondenceContributionEvent 
       add constraint FKm1rttrlv6gxibd85a5sc3c4js 
       foreign key (letterSoundCorrespondence_id) 
       references LetterSoundCorrespondence;

    alter table Number_Word 
       add constraint FKspo8bt34fftva3y5jac7p2no1 
       foreign key (words_id) 
       references Word;

    alter table Number_Word 
       add constraint FKim83prd786jsowiyrhdf1vo59 
       foreign key (Number_id) 
       references Number;

    alter table NumberContributionEvent 
       add constraint FK8tr84kkqmavan1jxfmc1pq8h6 
       foreign key (contributor_id) 
       references Contributor;

    alter table NumberContributionEvent 
       add constraint FKkfyssxfqg6x1vygyhjks96m4u 
       foreign key (number_id) 
       references Number;

    alter table Sound 
       add constraint FKg3qs5563grk5e6f1idffmklh4 
       foreign key (audio_id) 
       references Audio;

    alter table StoryBook 
       add constraint FKkwr1b53nrmjdvd874vsiql21a 
       foreign key (coverImage_id) 
       references Image;

    alter table StoryBookChapter 
       add constraint FKcnlksdikth82ec6nia8tb3cps 
       foreign key (image_id) 
       references Image;

    alter table StoryBookChapter 
       add constraint FKaqnew7dipgs9ffkfh2js25l1g 
       foreign key (storyBook_id) 
       references StoryBook;

    alter table StoryBookContributionEvent 
       add constraint FK3s4f77htgff63dqy4diam9fc9 
       foreign key (contributor_id) 
       references Contributor;

    alter table StoryBookContributionEvent 
       add constraint FKpuk0ynailkg93eiaf62tn2phy 
       foreign key (storyBook_id) 
       references StoryBook;

    alter table StoryBookLearningEvent 
       add constraint FK8f7cr6xa4n3kgrmffy7crtcrn 
       foreign key (application_id) 
       references Application;

    alter table StoryBookLearningEvent 
       add constraint FKi731lr5iofppbd0lod4pjoufr 
       foreign key (storyBook_id) 
       references StoryBook;

    alter table StoryBookParagraph 
       add constraint FKdna2npdcgkq74v2306anb4f6s 
       foreign key (storyBookChapter_id) 
       references StoryBookChapter;

    alter table StoryBookParagraph_Word 
       add constraint FKecjq9ll62036jtbwl3g9vytg8 
       foreign key (words_id) 
       references Word;

    alter table StoryBookParagraph_Word 
       add constraint FK6kx5ydfx49dfl5oy44bold81k 
       foreign key (StoryBookParagraph_id) 
       references StoryBookParagraph;

    alter table StoryBookPeerReviewEvent 
       add constraint FKjc6t09q4xff532a4s8jocuvs1 
       foreign key (contributor_id) 
       references Contributor;

    alter table StoryBookPeerReviewEvent 
       add constraint FKe1bnu38w5m0dc0qkeuuxf4g5h 
       foreign key (storyBookContributionEvent_id) 
       references StoryBookContributionEvent;

    alter table Syllable_Sound 
       add constraint FKlfp5s4xc4wi7s7fo980027tl1 
       foreign key (sounds_id) 
       references Sound;

    alter table Syllable_Sound 
       add constraint FK627nj3gkx5dn4xn9g4tmnmbdx 
       foreign key (Syllable_id) 
       references Syllable;

    alter table Video_Letter 
       add constraint FK426jmgm09qif0fhqke99ejl8c 
       foreign key (letters_id) 
       references Letter;

    alter table Video_Letter 
       add constraint FKlmbmpg1y1jue79i9w0f3ejetp 
       foreign key (Video_id) 
       references Video;

    alter table Video_literacySkills 
       add constraint FKcp7t3km7xi2wkraaugjuk5xoo 
       foreign key (Video_id) 
       references Video;

    alter table Video_Number 
       add constraint FK5lrjvgqa5wnd49g6gsohlm0tg 
       foreign key (numbers_id) 
       references Number;

    alter table Video_Number 
       add constraint FKr064lw8ryd35xks27348u2s9a 
       foreign key (Video_id) 
       references Video;

    alter table Video_numeracySkills 
       add constraint FKt545qojkqdegjg5muf41ltk86 
       foreign key (Video_id) 
       references Video;

    alter table Video_Word 
       add constraint FK2un2s9ljli58i2qkjmvdpwfc7 
       foreign key (words_id) 
       references Word;

    alter table Video_Word 
       add constraint FKplswdv1whriquc00dsaxrqe0s 
       foreign key (Video_id) 
       references Video;

    alter table Word 
       add constraint FKd1ussioi3bpu2tmxm0cim5s5a 
       foreign key (rootWord_id) 
       references Word;

    alter table Word_LetterSoundCorrespondence 
       add constraint FKf6r3yfdc6quwa0b13mln5uuc8 
       foreign key (letterSoundCorrespondences_id) 
       references LetterSoundCorrespondence;

    alter table Word_LetterSoundCorrespondence 
       add constraint FKemcgw1900hl4aumckhof0574i 
       foreign key (Word_id) 
       references Word;

    alter table WordContributionEvent 
       add constraint FKrsen7udud4svhc32e3rhkcmnu 
       foreign key (contributor_id) 
       references Contributor;

    alter table WordContributionEvent 
       add constraint FKkwqjkxvg3rvmp1kys6fr8blwq 
       foreign key (word_id) 
       references Word;

    alter table WordLearningEvent 
       add constraint FKb5jjaetgs99whlxywbi0palby 
       foreign key (application_id) 
       references Application;

    alter table WordLearningEvent 
       add constraint FK221ytgbt7u8eajdics6a5sloe 
       foreign key (word_id) 
       references Word;

    alter table WordPeerReviewEvent 
       add constraint FKp3i671x4kb823ayc73381gk33 
       foreign key (contributor_id) 
       references Contributor;

    alter table WordPeerReviewEvent 
       add constraint FKjyi59inavblt0afri8vd3xhw1 
       foreign key (wordContributionEvent_id) 
       references WordContributionEvent;

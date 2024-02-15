---
layout: article
title: "Visualising Sentiment Data of Covid-19 Local Newspaper Headlines in Indonesia"
share: true
modified: 2024-02-15T10:23:57-04:00
image:
    teaser: diss-prev.png
categories: portofolio
---

*This research project delves into the realm of data visualisation, sentiment analysis, and automated geotagging within the context of Indonesian news headlines related to COVID-19 vaccines. The primary objective is t develop a visualisation dashboard that offers insight into the distribution of sentiment within the local news headlines and explores the potential of Bidirectional Encoder Representations from Transformers (BERT) and Conditional Random Field (CRF) models.*

<p class="notice-inverse"><strong>Author:</strong> Ninda Khoirunnisa. This is the dissertation project in MSc Data Science Program, The University of Manchester, 2023</p>

# Introduction

## Background and motivation

Data visualisation has become a pivotal tool in understanding sentiments surrounding COVID-19 vaccines within  Indonesia, specifically through an analysis of local newspaper headlines. Aiming to draw insight from local newspaper headlines, this project seeks to provide an understanding of the sentiments expressed in the media coverage. This project employs Named Entity Recognition (NER) to identify locations in title data. The use of NER is vital due to the absence of province information in some news data which is crucial to create a comprehensive
map in the visualisation dashboard.

Visualising the spread of news with negative sentiment from local news media can help the policymaker better understand which provinces in Indonesia might be more negatively impacted by the published news headlines. This tool would be beneficial for policymakers to design strategies to combat the negative sentiment in published news headlines that affect how the public perceives COVID-19 vaccines.

## Aims and Objectives

This study sought to develop a visualisation dashboard of the distribution of sentiment from local newspaper headlines in the Indonesian language. It explores the potential Bidirectional Encoder Representations from Transformers (BERT) and Conditional Random Field (CRF) models in automatically geo-tag locations of news headlines. The main objectives can be divided into sub-objectives with the following research questions.

| 1. Define suitable dataset to train NER model | - What is the available dataset that can be used to train a NER model? |
| | - What tagging scheme is suitable to be used in the dataset that will be used to train NER model? |
| 2. Collect COVID-19 vaccines news headline data from national and local news media in Indonesia | - What libraries can be used to collect news headline data in the Indonesian language from Google News? |
| | - How to measure the credibility of the collected data?|
| | - What linking method should be employed to merge the collected datasets? |
| | - What pre-processing steps should be done before storing the data? |
| | - What important attributes should be stored in the database? |
| 3. Develop NER model to detect location from mentioned entities name from the news headlines | - How is the architecture of BERT-CRF model to automatically add geo-tag from detected entities name in news headline? |
| | - How different hyperparameters can affect the performance of BERT-CRF model? |
| | - How is the performance of the BERT-CRF model? |
| 4. Assess the model performance on COVID-19 vaccines news headlines dataset | - How is the performance of the BERT-CRF model compared to the baseline model? |
| | - How is the performance of BERT compared to other word-embedding methods? |
| 5. Develop model to analyse sentiment of news headline | - What is the difference between supervised and unsupervised learning in sentiment analysis? |
| | - What are the pre-processing steps needed before analysing the data? |
| 6. Develop a visualisation dashboard that displays the news headline’s sentiment from news media across all provinces in Indonesia | - How is the design of the dashboard? |
| | - How to handle the sparse data? |
| | - What kind of chart is suitable to visualise the data? |
| | - How is the architecture of the system? |
| | - How to measure the functionality of the dashboard? | 

# Literature Review

## Vaccine Hesitancy

WHO defines vaccine hesitancy as a condition where there is a delay in acceptance or refusal of a vaccine despite the availability of vaccine services (MacDonald, 2015; Machingaidze & Wiysonge, 2021). Studies by Simione et al. (2021) and Veldwijk et al. (2015) stated that vaccine hesitancy is also associated with beliefs in conspiracy theories. Moreover, another research by Kwon and Park (2023) concluded that vaccine hesitancy is caused by concern about the vaccine’s safety (Griffith et al., 2021; Hou et al., 2021; Puri et al., 2020), anti-vaccination
belief (Jamison et al., 2020), spread of fake news and misinformation (Donzelli et al., 2018), mistrust in policymakers and health professionals (Montagni et al., 2021), and other factors such as political ideology (X. Jiang et al., 2021).

## COVID-19 in NLP Perspective

The spread of information including confusing messages and misinformation is worrying during the COVID-19 pandemic, especially because it may lead to opinion differences among the general public (Ibeke et al., 2017, 2020). During the COVID-19 outbreak, the general public relies on newspaper because it is where they can get information about events that happen around them and how they impact their lives (Amujo et al., 2023; Ghasiya & Okamura, 2021).

### Sentiment Analysis

NLP can be used to analyse feelings contained in social media texts to understand how society behaves and reacts to COVID-19. When it comes to analysing people’s sentiments on social media, Twitter is commonly chosen as a source of opinion mining because of its prominence (Chinnasamy et al., 2022). Machuca et al. (2021) proposed a sentiment analysis of English tweets during the COVID-19 pandemic. The dataset used to train the Logistic Regression model contains tweets from 2020. The model was used to classify the sentiment of a tweet into positive and negative with an accuracy of 78,5% on the test data. The other study by (Chinnasamy et al., 2022) specifically analysed how commuter lines or public transportation passengers react to COVID-19 being transmitted using NLTK which was chosen because it is optimal to classify text from the internet which can be quite extensive. Moreover, this study compared the Naïve Bayes classifier and decision tree on which algorithm produces higher accuracy.

### Pre-Trained Model for Sentiment Analysis

Giving labels to training data in supervised learning is crucial because the accuracy of the model mainly depends on it. However, some problems may arise in this stage as it is time-consuming and it needs human expertise to reduce  the risk of bias and human error (Arifiyanti et al., 2022; Geiger et al., 2020). Therefore, the pre-trained model has been utilised in sentiment prediction and labeling for training datasets to be used in supervised learning.

In the context of using the Indonesian language, a study by Arifiyanti et al. (2022) used and compared pre-trained model libraries named Vader, Textblob, and Flair to analyse the sentiment of a dataset that was collected from Twitter. This research shows that Vader outperforms the other alternatives when it comes to annotating datasets.

### Automated Geotagging Location

According to B. Li et al. (2021), geo-information plays a pivotal role in monitoring and analysing the spread of epidemic disease. However, data that was mined from Twitter API rarely have information about the user’s location. Therefore, to overcome this restriction, this study (Varol et al., 2022) explored the potential of NLP and NER in extracting location entities from the textual data and combining them with the geographic coordinates based on the tweet’s bounding box.

## Web-Scraping

Numerous studies utilise web scraping techniques in data acquisition. Thota and Ramez (2021), utilised a web-scraping method to automatically collect news data and analyse the sentiment and emotions of the statement given by leaders amidst the COVID-19 pandemic. Furthermore, this study also provided a comparison of different web-scraping libraries that can be used in Python and R.

Another study by Khan et al. (2023) implemented web-scraping to automate the collection and aggregation process of COVID-19 case and death data in the United States. This study aimed to track the spread of the COVID-19 virus at many levels namely national, state, and country. The web-scraping was used to collect publicly available COVID-19 case and death data from various sources, including websites, data feeds (available through API, spreadsheets,
GitHub), official press releases and verified statements, and official webpages or social media pages associated with the government.

## Dashboard Visualisation

Visualisation dashboard has been widely used to display COVID-19-related data in various studies. A study by Dong et al. (2022) revealed the technical details of the John Hopkins University Center for Systems Science and Engineering (JHU CSSE) which has been referred to as a global database that provides a hub for many stakeholders such as the public, scientists, and policymakers to understand the spread of COVID-19. These technical details underlying
the dashboard have served as a platform to view the dynamics of the COVID-19 pandemic globally. 

# Data and Methodology

The architecture of the proposed framework to acquire data, merge datasets, analyse, and visualise the sentiment of an online news headline about COVID-19 in Indonesia that is positively related to vaccine hesitancy is
illustrated in Figure 1. This framework consists of a scraper that retrieves online news headlines that satisfy the predefined search criteria or keyword and another scraper that gathers news’ credibility based on its news media’s
verification status by Indonesia’s Independent Journalists Association. Every news article data that has been collected will be processed before being analysed. The analysis in this study was separated into two steps: sentiment analysis based on the news title; and localisation of the news article to define the geo-location in which the news is associated based on the name of the place or organisation that was mentioned in the headlines. Information obtained from the two-step analysis will be added as new attributes when the data is stored in a database. The visualisation dashboard retrieves the data from the database through services provided by the back-end and creates a visualisation in several forms to show the trend of the data over time.

<img src="{{ site.url }}/images/diss-1.png">

<cite>**Figure 1.**  WThe proposed framework that collects, classify, analyse, and visualises online news
headline related to COVID-19 vaccines in Indonesia</cite>

## Data Acquisition

### News Headlines Dataset

According to Evensen and Clarke (2012), people tend to rely on news media as the main source of factual and up-to-date information to follow the issues related to public health. Considering that online news data is publicly available, easier to collect, and more up-to-date than printed news articles, online news data will be used in this study. 

Despite its bias as a news aggregator where the search result depends heavily on the used keywords and not on the user’s geographical location (Fischer et al., 2020), Google News is chosen as the targeted platform to collect news headline data mainly because of two reasons: firstly because it dominates the global internet traffic thus their contents are accessible to wider audients (Ebrahim, 2022; Kikerpill & Kõuts-Klemm, 2023) and secondly because it allows users to add filters for the search results.

The keywords such as covi, covid vaccine, vaccine, sinovac, astrazeneca, moderna, pfizer, vaccination, sinopharm, novavax, sputnik-v, janssen, zivivax were used to collect news headlines samples that were published from 21st January 2020 to 14th July 2023 from Google News by using pygooglenews. This Python library was chosen because it supports keyword and time filters in Google News which prevent the result from obtaining irrelevant content. Furthermore, this library also offers some advantages such as it is open source and it also allows users to add language and region filters compared to Mediastack and Webz.io which provide similar functions but as paid services.

Each data in this dataset has attributes of `id`, `title`, `link`, `province`, `source_link`, `date_published`, `source`. In total, 20,099 news headlines were gathered in this process. In this study, news headlines are being analysed instead of the full article because it’s assumed to have provided the summary of the full articles (Montgomery & Feng, 2016) and users tend to skip the full article because in some cases users think the headlines have provided sufficient information (Ebrahim, 2022).

### News Credibility Dataset

Dewan Pers is an independent journalists association in Indonesia. Its website provides a list of verified news media.  In this list, news media’s status differs into two, namely ’Administratively Verified’ and ’Administratively Verified and Factual’. Each data in this dataset provides information about ’Media Name’, ’Media Type’, ’Province’, ’Address’, ’Phone Number’, ’Email’, ’Website’, ’Status’, and ’User Status Certificate Date’.

In Dewan Pers website, users can navigate through the tables that show 10 data per page. However, collecting 1,750 pieces of data manually could be time-consuming. Thus, in this process, the data collection process was done  utomatically by utilising the web-scraping method. Selenium was used in this research mainly because of two reasons: firstly because the target website has multiple pages thus performing clicks is needed and Selenium offer this functionality while the other methods do not, and secondly because its limitation which is slow loading time can be neglected as the web-scraping will only be done once.

## Data Pre-Processing

In order to link both datasets, several steps of pre-processing stage were carried out prior to the merging because the `Website` column in the news credibility dataset and `source_link` in the news headline dataset have different formats. Figure 2 shows the pre-processing step for the `Website` attribute in the news credibility dataset meanwhile Figure 3 shows the pre-processing step for `source_link` in the news headlines dataset. After both columns in the datasets have the same formats, the `Website` column was renamed to `source_link` and the datasets are merged on these columns.

<img src="{{ site.url }}/images/diss-2.png">

<cite>**Figure 2.**  Pre-processing steps for ’website’ data in news credibility dataset</cite>

<img src="{{ site.url }}/images/diss-3.png">

<cite>**Figure 3.**  Pre-processing steps for ’source_link’ data in news headlines dataset</cite>

As shown in Figure 3, each article in the news headline dataset will be classified into two groups, namely ’verified and actual’ and ’verified’ based on its source_link value. Additionally, every news headline’s source link that does not exist in Dewan Pers list will be given ’unverified’ status. These statuses were then been mapped to numerical: 2, 1, and 0 values respectively.

<img src="{{ site.url }}/images/diss-4.png">

<cite>**Figure 4.**  Crawling process of the online news headline data</cite>

After removing the duplicates, the dataset contains 10,414 annotated articles whose statistics is shown in Table 1.

<cite>**Table1 .**  Dataset Statistics</cite>

| Verification Status | Number of articles |
| ------- | ----- |
| Verified and factual | 8,592 | 
| Verified | 312 |
| Unverified | 1,510 |

`title` is the attribute from the dataset that will be used in the next stage. Ensuring that the context of the news headline can be understood in the analysis stage is critical. However, 2,065 out of all articles did contain the full title. Based on that, an additional step of web-scraping is needed to collect the full title of the article. The complete description of attributes in the dataset can be seen in Table 2.

<cite>**Table 2.**  Dataset Description</cite>

| Column | Description |
| ------- | ----- |
| `id` | News identifier provided by Google News | 
| `title` | Title or headline of the news |
| `link` | Link that redirects to the news page. |
| `province` | Provide the location of the news media’s office. Null values in this column indicates that the news media is not verified by Dewan Pers thus the province is missing. |
| `source_link` | URL that redirects to the news media page |
| `source_name` | The news media name from the Dewas Pers website. |
| `date_published` | The date on which the news is published. |
| `full_title` | The full title of an article that was gotten by newspaper3k. |

## Sentiment Analysis

Pre-trained model libraries can be used in unsupervised learning. Sentiment analysis with this approach depends on the dictionary approach to map lexical features to sentiment intensity scores (Ainapure et al., 2023). A study by Arifiyanti et al. (2022) compared supervised learning with unsupervised learning in sentiment analysis and using the pre-trained model library was proven to outperform the classifier built from scratch. Moreover, this study also
compared different pre-trained models namely Valence Aware Dictionary for sEntiment Reasoning (VADER), Textblob, and Flair in sentiment analysis tasks in the Indonesian language and Vader was proven to be more accurate than Textblob and Flair. Considering how using the Vader library gives an advantage of not needing labelled data in sentiment analysis, the Vader library was chosen. However, this library does not accommodate the processing of texts on an Indonesian basis. Therefore, before entering the analysis stage, a translation step needs to be carried out with Easy-NMT.

In this research, three parallel processes as shown in Figure 5 will be carried out as three test cases and the results will be compared. In the first case, the pre-processing will be carried out on an Indonesian basis. In contrast, the pre-processing in the second scenario is based on English and the third scenario will skip the pre-processing stages.  The scenarios that result in the highest accuracy score will be implemented in the analysis stage of the news headline dataset.

<img src="{{ site.url }}/images/diss-5.png">

<cite>**Figure 5.**  Title pre-processing</cite>

## Localisation

As explained in the previous chapters, geo-information plays a crucial role in monitoring and analysing the spread of factors that trigger the public’s vaccine hesitancy such as news headlines with negative sentiment. However, most published news headlines that have been collected in this study miss that information. In recent years, NER has made it easier to mine location-related information from the textual content (B. Li et al., 2021).

### BERT Module

The model’s structure of BERT-CRF is shown in Figure 6. BERT take word tokens as its input sequence and randomly mask 15 percent of the inputs. Besides the word tokens from the text input, BERT also adds a special token named [CLS] to mark the beginning of a sequence and a special token [SEP] to mark the end of a sequence so separated two adjacent sentences can be differentiated. After adding special tokens, BERT masks some of the words in the sequence.
The embedding for each token in a sequence consists of three parts: token embedding, segment embedding, and position embedding (W. Li et al., 2022; Tang et al., 2023).

<img src="{{ site.url }}/images/diss-6.png">

<cite>**Figure 6.**  NER classification model based on BERT-CRF</cite>

BERT is comparable and has similar functionality in representing words in word vectors to other methods such as word2vec, ELMO, and GPT (W. Li et al., 2022). However, BERT offers an advantage in terms of generating language representation that contains context and semantic information from a text. This is in contrast to the other methods whose structure is more shallow and can only obtain one-way context information. Furthermore, BERT is also known to use huge amounts of data for its training, thus it has a stronger ability to deal with unlabeled data (W. Li et al., 2022). Due to that reason, BERT will be used in this study.

### CRF Module

The output from BERT module does not ensure the rationality of the predicted labels. As a result, ’I’ label that indicates the label for a token appears in the middle of an entity’s name might be predicted for the first word in a sequence. Furthermore, ’B’ label might appear consecutively in a sentence. This problem can be solved by utilising Conditional Random Field (CRF) as the label decoder.

CRF takes the output of the BERT module as its input. It tackles the shortcomings of BERT prediction results by learning the transition probability between adjacent labels in the training dataset to ensure the rationality of predicted labels and to avoid the occurrence of similar labels consecutively (W. Li et al., 2022).

### Experimental Setting for BERT-CRF Model

The proposed BERT-CRF model will be trained with a dataset that was taken from “NERGRIT CORPUS” (2022). This dataset consists of 1,672 sentences in the training dataset and 209 sentences in the validation dataset. There are three kinds of entities, namely ’PERSON’, ’PLACE’, and ’ORGANISATION’ used. Besides the entity’s name, each label also has a tag that represents the order of location of the word in the named entity. The tag in this dataset is IOB, where B-Beginning is used to label the first word in the named entity, I-Inside is used to label words after the starting point of an entity, and O-Outside is used to label a non-entity. 

Furthermore, in order to find the model with the best evaluation metrics F1 score, different hyperparameters will be tuned. The hyperparameters that will be compared in this study are as follows:
- `lr` (learning rate) = [3.125e-05, 6.25e-05, 3.125e-06, 6.25e-06]
- `num_layers` (number of layers in BERT): [9, 12, 15]

### Openstreetmap

The BERT-CRF model has the ability to add labels namely ’LOC’ for a location or address, ’PER’ for a person, and ’ORG’ for an organisation with IOB tagging scheme. After the label for each word token is given, the entity name will be extracted. The process of getting an entity name from the word token’s label is explained as follows

- Take the word tokens and a list of their predicted labels.
- Initialise an empty list named entities to store the entity name and the labels.
- Iterate through each word in the word tokens.
- Check the tag ’B-’, ’I-’, and ’O’ for each word. If the tag is started with ’B’, the word will be appended to entities.
- Check the tag of the next word. If the tag is started with ’I-’, the word will be appended to entities. It will extract the word that made up the full entity name.
- The entity name ends when there is a transition to a different label, i.e. from PER to LOC; or when the tag starts with ’B-’ or ’O’.

Every entity name that was extracted by the BERT-CRF model is stored as a new object within the document in news collection. This approach facilitates efficient retrieval and analysis of relevant information. In the next stage, the primary objective is to obtain the longitude and latitude coordinates from the location or organisation names. These coordinates will be used to obtain the province name associated with each entity. To achieve that objective, OpenStreetMap (OSM) was used.

## Visualisation Dashboard

Figure 7 shows how front-end, back-end, and data storage interact with each other. When the user accesses the website through the URL, the front-end will initially render the index page. Furthermore, users can interact with elements in the website to send customised requests which will be received by the back-end. The back-end will find the data that matches the user’s requirements and send the requested data to the front-end. In the end, the front-end is
responsible for rendering and displaying the requested data to the users.

<img src="{{ site.url }}/images/diss-7.png">

<cite>**Figure 7.**  Data flow between front-end, back-end, and data storage</cite>

### Data Storage

The acquired datasets from the previous stage are stored as separate collections in MongoDB. News credibility data that was scraped from Dewan Pers website is stored in the medias collectionwhile the news headline data is stored in the news collection.

### Back-End Web Framework

Flask is one of the most commonly used web servers (La Rosa et al., 2023). It allows its user to create a website with Python code. In this study, since most data science projects rely on Python libraries (Biswas et al., 2019), using Flask as a back-end web framework will be beneficial because it allows the users to import Python libraries that are needed and access the previously chosen data storage through pymongo library. In this project, the Flask file ’app.py’ is responsible for importing all the libraries. Besides that, it is also responsible for configuring the route and launching the application. 

### Front-End 

Data-Driven Document (D3) is a framework that has been widely used to generate and render visualisation (Shen et al., 2023), giving the user the ability to show the visual elements in a webpage as part of the user interface (Gangavarapu et al., 2023). Compared to other JavaScript-based environment frameworks such as React.js and Vue.js, D3 is the most commonly used framework (La Rosa et al., 2023).

D3’s proficiency in handling operations such as interpolation, geographic projections, and statistical methods surpasses that of jQuery and XSLT. The decision to employ D3 in this research project instead of other alternatives such as jQuery and XSLT is driven by several reasons. Firstly, jQuery lacks dynamic visualization capabilities that involve complex transitions because data must be bound to nodes individually rather than through high-level data join (Bostock et al., 2011). Secondly, XSLT is only suitable for simple transformations which makes it limited for math-intensive visualisations such as interpolation, geographic projection, and statistical methods (Bostock et al., 2011).

# Results

## Sentiment Analysis

The dataset from Purwarianti and Crisdayanti (2019) named SmSA dataset was used to assess the performance of these scenarios in terms of their accuracy in predicting the sentiment of the provided text. The accuracy score is defined as the number of true predicted labels divided by the number of all data in the dataset. The accuracy comparison of the three scenarios on the SmSA dataset is shown in Table 3.

<cite>**Table 3.**  Comparison of Accuracy with Different Pre-processing</cite>

|   | Pre-process in Indonesian | Pre-process in English | No pre-process |
| ------- | ----- | ---- | ----- |
| Accuracy (%) | 47.73 | 72.8 | 90.66 |

The acquired news headline dataset consists of 10,414 data. In order to get the sentiment of each data, the Easy-NMT translator used full_title as its input. The output of this process was then saved in the title_en column in the dataset and became the input for the VADER sentiment analyser.

The output of the VADER sentiment analyser was a compound score, a sum of valence scores of each word in the lexicon that was adjusted according to the rules and then normalised to range from -1 to +1. Following the rule in C. Hutto and Gilbert (2014) and C. J. Hutto (2023), threshold value to define the sentiment are as follows:

- Positive sentiment: compound score is greater than or equal to 0.05
- Neutral sentiment: compound score is greater than -0.05 or less than 0.05
- Negative sentiment: compound score is less than -0.05

By applying these rules, the final sentiment obtained for each data in the news headline dataset is shown in Table 4.

<cite>**Table 4.**  News sentiment in news headline dataset</cite>

|   | Positive | Neutral | Negative |
| ------- | ----- | ---- | ----- |
| Count | 2,714 | 5,845 | 1,855 |

## Localisation

The proposed model for localisation consists of BERT which performs word embedding and CRF as a decoder. The BERT layer receives word tokens as its input. The output of this layer was feed-forwarded to the CRF layer and the output of this layer is the label for each word.

### Hyperparameter Tuning

The default number of epochs in the training of this model is defined to be 20. However, an early stopping which allows the training to be stopped when the evaluation metric (F1 score) is not improving after three epochs is set. This is done to prevent the overfitting problem, which can be defined as a condition when a model fails to generalise the data thus it tends to be well fitted on the training data but perform terribly on the testing data (Ying, 2019).

### Model Evaluation

The best F1 score yielded in this process is 0.82 when the model was trained with `lr` = 3.125e-5 and `num_layers` = 12. This score is increased by 0.02 compared to the benchmark score from (Wilie et al., 2020) that only used BERT in the NER task as shown in Table 5.

<cite>**Table 5.**  Comparison of the proposed BERT-CRF model with BERT-base model</cite>

|   | BERT-CRF Model | BERT-base Model | 
| ------- | ----- | ---- |
| F-1 score | 0.82 | 0.8 |

In the news headline dataset, the proposed model is able to detect location and organisation from the `full_title` data and increase the data with province information from 4,430 to 5,914. Additionally, the BERT-CRF model might yield more than one province from the `full_title` text. If that case happens, all detected provinces from the text are considered and the news headline is geotagged multiple times and it will also be displayed in all provinces of the map it refers to.

The proposed model had a better F1 score than the BERT-base model because it used CRF as the decoder. In the proposed model, CRF also learns the label rules of NER, thus its evaluation score (F1) is improved.

## Dashboard Visualisation

The display of the visualisation dashboard in web browser is shown in Figure 8.

<img src="{{ site.url }}/images/diss-8.png">

<cite>**Figure 8.**  Webpage display</cite>

When users do not select a date from the slider, the data from each province on the most recent date will be displayed on the map without any aggregation on a weekly basis as shown in Figure 9. The colour of each province is associated with the number of published news on the chosen date. A colour legend, also known as a colour scale, is placed under the map to provide context and meaning to the map’s colour-coded data.

<img src="{{ site.url }}/images/diss-9.png">

<cite>**Figure 9.**  A choropleth map that shows the distribution of published news on chosen date across provinces in Indonesia</cite>

A user is able to change the chosen date through a date slider under the map. When the user moves the thumb on the date slider, the date on the map title is changed based on the date chosen by the user. The front end sends another request to the back end and then renders the map based on the newly received data. 

The details of the sentiment of published news in each province on the chosen date are shown to the users when they hover over the province. For instance, Figure 10 shows the number of each sentiment category on news that is based on DKI Jakarta province. On the other hand, Figure 11 shows that there is no news that is based on DI Yogyakarta province.

<img src="{{ site.url }}/images/diss-10.png">

<cite>**Figure 10.**  Tooltip when user hover over province with news data</cite>

<img src="{{ site.url }}/images/diss-11.png">

<cite>**Figure 11.**  Tooltip when user hover over province with no data</cite>

To handle the sparse data when the data is aggregated on a daily basis, the user is able to change the aggregation method from daily to weekly. Users can change this method by clicking on the ’Weekly’ option on the toggle in the top right corner of the map box. When the user changes the aggregation method, the colour legend under the map is changed. In addition, the step on the date slider is changed from 1 day to 7 days. The date shown in the map
title can be interpreted as the map showing the data for the week commencing the chosen date from the date slider.

Users are able to decide which provinces they want to focus on by choosing the provinces in the ’Select province’ check boxes. Figure 12 shows how the selected province moves upward on the list and how the map display is focused on the selected province by reducing the opacity of the unselected provinces.

<img src="{{ site.url }}/images/diss-12.png">

<cite>**Figure 12.**  Focused map on the selected provinces</cite>

# Discussion

This section discusses four points of the findings, focusing on the utilisation of the BERT-CRF model to detect named entities in Indonesian news headlines related to COVID-19 vaccines. Firstly, it discusses the quality of news headline data that has been collected through web-scraping. Secondly, it discusses the performance of the BERT-CRF model in the Indonesian COVID-19 Vaccines News Headlines Dataset. Thirdly, it discusses the performance of VADER
sentiment analysis in the Indonesian COVID-19 vaccines news headlines dataset. Lastly, it investigates the limitations of this study.

## Quality of the Indonesian COVID-19 Vaccines News Headlines Dataset

This research project has acquired news headline data from Google News which is a globally recognised and reliable news portal with a wide coverage that extends to Indonesia. The news available in Google News originates from diverse sources, ranging from credible news media, blogs, and online publications (“Google News”, n.d.). The news shown to its users can differ based on several factors, such as geographic location, user preferences, and relevance to the user’s search history and interest (“Google News”, n.d.).

In addition to the news headline dataset, this research project collects news credibility data from the website of the Independent Indonesian Journalists Association, Dewan Pers, which provides a list of verified national and local news media in Indonesia, to define the credibility of the news headline data. This dataset covers two verification statuses: ’Verified and Factual’ and ’Verified’. The news credibility dataset plays a pivotal role in annotating the credibility status of the news headline data. The quality of the annotation mainly relies on the linkages of
both datasets. The linkage process is based on a common attribute: `source_link`or `website`, both of which attributes essentially refer to the same thing. However, the website data from the news credibility dataset is messy because some of the entries are combined with email addresses. In addition, some entries in the `source_link` and `website` also contain the path or path segment. Consequently, some pre-processing steps were executed to guarantee that all entries in source_link and website are confined to the domain alone.

In the linking process, it’s important to acknowledge that not all collected news headline data’s source matches the `source_name` of verified news media data from Dewas Pers website. Therefore, any missing values in the credibility column on a news headline that was published by unverified source media after both datasets were merged will be imputed with the credibility status of ’Unverified’ that is represented by 0 value. By undertaking these processes, the research project has effectively mitigated and handled the problem caused by missing values. These steps collectively enhance the dataset’s quality, leading to a more robust foundation for the analysis and visualisation stages.

## BERT-CRF Model Performance

One interesting finding that is worth mentioning is that based on the results of hyperparameter tuning shown in Table 14, the variation in the number of layers from 9, 12, and 15 in the BERT architecture does not seem to have any effect on the evaluation metrics whereas modifying the learning rate does. It aligns with the finding in Jawahar et al. (2019) and Liu et al. (2019) that the performance of BERT layers seems to reach its maximum on the middle layer, around layers 8-9 on the BERT-base model. Hence, after a certain point, adding more layers may not significantly contribute to improved feature extraction. That being said, the model might already have learnt relevant features from the previous layers so that the additional layers might only capture minor nuances or noise in the data rather than extracting meaningful patterns (Rogers et al., 2021). In addition, how the number of layers in BERT architecture affects the performance of the model is also related to the size of the dataset used in the training. The GRIT-NER dataset that was used to train the BERT-CRF model is relatively small, thus increasing the number of layers might not yield substantial benefits due to the lack of diverse patterns in the dataset.

Based on the evaluation results presented in the previous chapter, the best parameter of the model is when the learning rate used was 3.125 × 10−5 . The evaluation metric that calculated the F1 score on the evaluation data shows an increment of 0.02 compared to the BERT-base model. The F1 score combines both precision and recall into a single value, providing a balanced assessment of the NER model’s performance where class imbalances exist due to the number of non-entities that greatly exceed the number of entities. It considers both false positives and false negatives, making it useful to measure when the cost of misclassification for different classes varies.

The proposed BERT-CRF model is able to leverage contextual information for improved entity recognition in Indonesian text compared to the BERT-base model. This is due to the utilisation of the CRF module, which also learns the transitional probability between each label, making the predicted label for each entity more logical (W. Li et al., 2022; Tang et al., 2023). This capability of CRF addresses the limitation of the BERT-base model that predicts entity
labels independently for each token. Integrating the BERT-CRF module in a single model leads to a more accurate identification of named entities, which in turn contributes to the improved metric, such as the F1 score.

## VADER Sentiment Analysis on the Indonesian COVID-19 Vaccines News Headlines Dataset

In this section, the application of the VADER sentiment analysis method on the Indonesian COVID-19 vaccines news headlines dataset is delved into. According to the comparison of different approaches taken before the analysis stage, the scenario that skips the pre-processing step is proven to yield the best accuracy result on the SmSA dataset. Therefore this approach is utilised on the Indonesian COVID-19 Vaccines News Headlines Dataset.

In the first scenario, the context of data might be lost in the pre-processing. Stemming and stopwords removal might also remove the context of the text thus it made the accuracy of the translation to be lower. In the second scenario, the text have been translated before underwent pre-processing stage in English basis. It had better accuracy than the first scenario. However, the stopword removal in the preprocessing stage might also remove the full context from the text. Thus, the accuracy score of this scenario was lower than the third scenario.

VADER sentiment analyser, as cited from (C. Hutto & Gilbert, 2014), uses its lexical features while also putting the five rules that embody the grammatical and syntactical conventions used by humans into consideration to convey the intensity of sentiment. Some of the grammatical and syntactical cues that are used to convey the sentiment intensity of a word are the use of punctuation and capitalisation. It justifies why the scenario that skipped pre-processing and kept the punctuation and did not transform the word to lowercase resulted in a better accuracy score compared to others. Thus, the third scenario was selected to analyse the sentiment of news titles in the news headline dataset that has been acquired.

In the context of sentiment analysis, VADER offers a simple and straightforward solution that does not require data annotation. However, its reliance on a predefined lexical dictionary raises considerations when it is applied to sentiment analysis tasks in specialised contexts like COVID-19, especially when a term like ’positive’ has positive polarity by default. This poses challenges when applied to COVID-19 discussions where the term ’positive’ could have negative connotations. It leads to misclassification in some news headlines that contain ’positive’ term in the title. For instance, the sentiment of headline ”13 Pegawai Positif Covid-19, SCTV dan Indosiar Menutup Studio” which was translated to ”13 Officers Have Been Tested Positive for COVID-19, SCTV and Indosiar Temporarily Closed Their Studio” was mistakenly categorised as positive due to the lexical positivity of certain terms.

## Limitations

Even though this research project meets all its research objectives, it is important to outline several limitations that need to be considered when interpreting and applying the results. These limitations underscore the need for cautious consideration when applying the results in broader contexts or drawing conclusions.

One significant limitation of this study is related to the languages that can be analysed by VADER. After translating the sentences from Indonesian to English, the nuances, contexts, and sentiments conveyed in the text written in Indonesian may not be fully captured. Furthermore, the quality of the translator tool may impact the overall accuracy of sentiment classification by VADER. This translation step adds an additional layer of complexity that might introduce some level of noise or biases which could affect the outcomes.

Despite the effectiveness in terms of time and cost needed to annotate the data, VADER sentiment analysis exhibits certain limitations, particularly when applied to specialised domains such as COVID-19. It relies on a lexical dictionary to determine polarity by assigning scores to a word based on its valence. This approach is generally robust (C. J. Hutto, 2023). However, it can encounter a challenge in domains where a word is context-dependent. In the context of COVID-19 discussions, certain words’ sentiment polarity, such as the word ’positive’, may be shifted to have a negative connotation due to its association with disease transmission even though typically it is associated with a favourable sentiment. This problem limits the constraint of relying solely on a lexical dictionary, as it may not adequately capture nuanced changes in sentiment within specialised subject areas like the COVID-19 domain.

# Conclusion

The main aim of this study is to develop a visualisation dashboard that displays the distribution of news sentiment extracted from local news headlines related to COVID-19 vaccinesin the Indonesian language. Simultaneously, it aimed to explore the potential of Bidirectional Encoder Representations from Transformers (BERT) and Conditional Random Field (CRF) models in the domain of automated geo-tagging locations. Through a meticulously designed series of objectives that were divided into research questions, this research project aimed to address these challenges and provide valuable insights into the proposed methodologies.

A total of 10,414 news headlines data were successfully crawled by using the Google News Python library. To enrich the information about the source of these news headlines, additional information related to the news media’s credibility was also collected from Dewan Pers website by utilising a web-scraping method with selenium web-driver. Pre-processing steps on the `source_link` of the news headlines and news media’s website from both datasets were conducted to be able to merge the datasets and impute the missing values to improve the quality of the merged dataset.

As a powerful method in word embeddings, the BERT module was chosen as the main model architecture. In order to maximise the potential of this model, hyperparameter tuning was performed during the training phase. This process aimed to identify a specific hyperparameter that would best optimise the model’s performance as assessed by the F1 score as the evaluation metric. Two hyperparameters, namely the number of layers and the learning rate were tuned.
The result of the tuning process shows that the proposed model exhibited superior performance compared to the BERT-base model that was used as a benchmark, as proven by the notable improvement of 0.02 in the F1 score. This improvement is attributed to the integration of the CRF module within the BERT architecture. The CRF module captures the sequential dependency and pattern of the word token better than the BERT model. It enables the model to consider the contextual relationship and logic between labels thus resulting in more accurate location geo-tagging.

The outcomes of this study collectively emphasise the potential for cross-disciplinary collaboration between natural language processing and data visualisation. By seamlessly integrating advanced techniques, this research project demonstrates how complex real-world challenges can be addressed, leading to tangible and valuable outcomes.

Another pivotal accomplishment of this study was the successful utilisation of the VADER
sentiment analysis tool to assess the sentiment of published news headlines about COVID-19
vaccines. It contributes to a deeper understanding of the polarity and tone carried within local news headlines across all provinces in Indonesia.

Moreover, rigorous tests were conducted to ensure the functionality of the visualisation dashboard. It confirms the good performance across all components during the unit and interface testing, ensuring the reliability as well as usability of the dashboard and enhancing its utility for researchers and stakeholders seeking insights from the distribution of sentiment in local news headlines related to COVID-19 in order to address the vaccine hesitancy problem.

In summary, this research project not only accomplished its aims and objectives but also showcased the potential for technology-driven solutions to address real-world complex problems, such as understanding the trigger of vaccine hesitancy in the midst of a pandemic. As the landscape of natural language processing and data visualisation continues to evolve, the findings presented here will likely serve as a stepping stone for future advancements in similar domains.

# References

- Adult’s Media Use and Attitudes report 2020/21. (N.d.). [https://www.ofcom.org.uk/__data/assets/pdf_file/0025/217834/adults-media-use-and-attitudes-report-2020-21.pdf](https://www.ofcom.org.uk/__data/assets/pdf_file/0025/217834/adults-media-use-and-attitudes-report-2020-21.pdf)

- Ainapure, B. S., Pise, R. N., Reddy, P., Appasani, B., Srinivasulu, A., Khan, M. S., & Bizon, N. (2023). Sentiment Analysis of COVID-19 Tweets Using Deep Learning and Lexicon-Based Approaches [Number: 3 Publisher: Multidisciplinary Digital Publishing Institute]. Sustainability, 15(3), 2573.

- Amujo, O., Ibeke, E., Fuzi, R., Ogara, U., & Iwendi, C. (2023). Sentiment Computation of UK-Originated COVID-19 Vaccine Tweets: A Chronological Analysis and News Effect. Sustainability, 15(4), 3212.

- Andreadis, S., Antzoulatos, G., Mavropoulos, T., Giannakeris, P., Tzionis, G., Pantelidis, N., Ioannidis, K., Karakostas, A., Gialampoukidis, I., Vrochidis, S., & Kompatsiaris, I. (2021). A social media analytics platform visualising the spread of COVID-19 in Italy via exploitation of automatically geotagged tweets. Online Social Networks and Media, 23, 100134.

- Arifiyanti, A. A., Kartika, D. S. Y., & Prawiro, C. J. (2022). Using Pre-Trained Models for Sentiment Analysis in Indonesian Tweets [ISSN: 2767-7087]. 2022 6th International Conference on Informatics and Computational Sciences (ICICoS), 78–83.

- Ashley, D. (2020). HTML Pages and CSS. In D. Ashley (Ed.), Foundation Dynamic Web Pages with Python: Create Dynamic Web Pages with Django and Flask (pp. 29–69). Apress.

- Biswas, S., Islam, M. J., Huang, Y., & Rajan, H. (2019). Boa Meets Python: A Boa Dataset of Data Science Software in Python Language [ISSN: 2574-3864]. 2019 IEEE/ACM 16th International Conference on Mining Software Repositories (MSR), 577–581.

- Bostock, M., Ogievetsky, V., & Heer, J. (2011). D³ Data-Driven Documents [Conference Name: IEEE Transactions on Visualization and Computer Graphics]. IEEE Transactions on Visualization and Computer Graphics, 17 (12), 2301–2309.

- Breedvelt, J. J. F., Zamperoni, V., South, E., Uphoff, E. P., Gilbody, S., Bockting, C. L. H., Churchill, R., & Kousoulis, A. A. (2020). A systematic review of mental health measurement scales for evaluating the effects of mental health prevention interventions. European Journal of Public Health, 30(3), 510–516.

- Castro, E. (2006). HTML, XHTML, and CSS, Sixth Edition: Visual QuickStart Guide [GoogleBooks-ID: kLfQQShrTXoC]. Pearson Education.

- Chew, C., & Eysenbach, G. (2010). Pandemics in the Age of Twitter: Content Analysis of Tweets during the 2009 H1N1 Outbreak [Publisher: Public Library of Science]. PLOS ONE, 5(11), e14118.

- Chinnasamy, P., Suresh, V., Ramprathap, K., Jebamani, B. J. A., Srinivas Rao, K., & Shiva Kranthi, M. (2022). COVID-19 vaccine sentiment analysis using public opinions on Twitter. Materials Today: Proceedings, 64, 448–451.

- COVID-19 Map. (N.d.). Retrieved August 30, 2023, from [https://coronavirus.jhu.edu/map.html](https://coronavirus.jhu.edu/map.html)

- Cucinotta, D., & Vanelli, M. (2020). WHO Declares COVID-19 a Pandemic. Acta Bio Medica: Atenei Parmensis, 91(1), 157–160.

- The Data Visualisation Catalogue. (N.d.). Retrieved August 29, 2023, from [https://datavizcatalogue.com/](https://datavizcatalogue.com/)

- Deiner, M. S., Fathy, C., Kim, J., Niemeyer, K., Ramirez, D., Ackley, S. F., Liu, F., Lietman, T. M., & Porco, T. C. (2019). Facebook and Twitter vaccine sentiment in response to measles outbreaks [Publisher: SAGE Publications Ltd]. Health Informatics Journal, 25(3), 1116–1132.

- Devlin, J., Chang, M.-W., Lee, K., & Toutanova, K. (2019). BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding [arXiv:1810.04805 [cs]].

- Dong, E., Ratcliff, J., Goyea, T. D., Katz, A., Lau, R., Ng, T. K., Garcia, B., Bolt, E., Prata, S., Zhang, D., Murray, R. C., Blake, M. R., Du, H., Ganjkhanloo, F., Ahmadi, F., Williams, J., Choudhury, S., & Gardner, L. M. (2022). The Johns Hopkins University Center for Systems Science and Engineering COVID-19 Dashboard: Data collection process, challenges faced, and lessons learned [Publisher: Elsevier]. The Lancet Infectious Diseases, 22(12), e370–e376.

- Donzelli, G., Palomba, G., Federigi, I., Aquino, F., Cioni, L., Verani, M., Carducci, A., & Lopalco, P. (2018). Misinformation on vaccination: A quantitative analysis of YouTube videos [Publisher: Taylor & Francis _eprint: [https://doi.org/10.1080/21645515.2018.1454572](https://doi.org/10.1080/21645515.2018.1454572)].

- Human Vaccines & Immunotherapeutics, 14(7), 1654–1659. Ebrahim, S. (2022). The corona chronicles: Framing analysis of online news headlines of the COVID-19 pandemic in Italy, USA and South Africa [Number: 1]. Health SA Gesondheid,
27 (1). Retrieved August 20, 2023, from [https://www.ajol.info/index.php/hsa/article/view/232269](https://www.ajol.info/index.php/hsa/article/view/232269)

- Evensen, D. T., & Clarke, C. E. (2012). Efficacy Information in Media Coverage of Infectious Disease Risks: An Ill Predicament? [Publisher: SAGE Publications Inc]. Science Communication, 34(3), 392–418.

- Feuerstein, S., & Pribyl, B. (2002). Oracle PL/SQL Programming [Google-Books-ID: 47WzweLc0uAC]. ”O’Reilly Media, Inc.” Fischer, S., Jaidka, K., & Lelkes, Y. (2020). Topical biases in local news curation: An audit of
Google News.

- Gangavarapu, K., Latif, A. A., Mullen, J. L., Alkuzweny, M., Hufbauer, E., Tsueng, G., Haag, E., Zeller, M., Aceves, C. M., Zaiets, K., Cano, M., Zhou, X., Qian, Z., Sattler, R., Matteson, N. L., Levy, J. I., Lee, R. T. C., Freitas, L., Maurer-Stroh, S., … Hughes, L. D. (2023). Outbreak.info genomic reports: Scalable and dynamic surveillance of SARS-CoV-2 variants and mutations [Number: 4 Publisher: Nature Publishing Group]. Nature Methods, 20(4), 512–522.

- Gatto, M. (2015). Making research useful : Current challenges and good practices in data visualisation. Retrieved August 29, 2023, from [https://ora.ox.ac.uk/objects/uuid:526114c2-8266-4dee-b663-351119249fd5](https://ora.ox.ac.uk/objects/uuid:526114c2-8266-4dee-b663-351119249fd5)

- Geiger, R. S., Yu, K., Yang, Y., Dai, M., Qiu, J., Tang, R., & Huang, J. (2020). Garbage In, Garbage Out? Do Machine Learning Application Papers in Social Computing Report Where Human-Labeled Training Data Comes From? [arXiv:1912.08320 [cs]]. Proceedings of the 2020 Conference on Fairness, Accountability, and Transparency, 325–336.

- Ghasiya, P., & Okamura, K. (2021). Investigating COVID-19 News Across Four Nations: A Topic Modeling and Sentiment Analysis Approach. IEEE Access, 9, 36645–36656.

- Ghimire, D. (2020). Comparative study on Python web frameworks: Flask and Django [Accepted: 2020-05-25T13:05:24Z]. Retrieved August 23, 2023, from [http://www.theseus.fi/handle/10024/339796](http://www.theseus.fi/handle/10024/339796)

- Google News. (N.d.). Retrieved August 27, 2023, from [https://news.google.com/about/](https://news.google.com/about/)

- Griffith, J., Marani, H., & Monkman, H. (2021). COVID-19 Vaccine Hesitancy in Canada: Content Analysis of Tweets Using the Theoretical Domains Framework [Company: Journal of Medical Internet Research Distributor: Journal of Medical Internet Research Institution: Journal of Medical Internet Research Label: Journal of Medical Internet Research Publisher: JMIR Publications Inc., Toronto, Canada]. Journal of Medical Internet Research, 23(4), e26874.

- Gui, X., Kou, Y., Pine, K. H., & Chen, Y. (2017). Managing Uncertainty: Using Social Media for Risk Assessment during a Public Health Crisis. Proceedings of the 2017 CHI Conference on Human Factors in Computing Systems, 4520–4533.

- Győrödi, C. A., Dumşe-Burescu, D. V., Zmaranda, D. R., & Győrödi, R. Ş. (2022). A Comparative Study of MongoDB and Document-Based MySQL for Big Data Application Data Management [Number: 2 Publisher: Multidisciplinary Digital Publishing Institute]. Big Data and Cognitive Computing, 6(2), 49.

- Hayawi, K., Shahriar, S., Serhani, M. A., Taleb, I., & Mathew, S. S. (2022). ANTi-Vax: A novel Twitter dataset for COVID-19 vaccine misinformation detection. Public Health, 203, 23–30.

- Hou, Z., Tong, Y., Du, F., Lu, L., Zhao, S., Yu, K., Piatek, S. J., Larson, H. J., & Lin, L. (2021). Assessing COVID-19 Vaccine Hesitancy, Confidence, and Public Engagement: A Global Social Listening Study [Company: Journal of Medical Internet Research Distributor: Journal of Medical Internet Research Institution: Journal of Medical Internet Research Label: Journal of Medical Internet Research Publisher: JMIR Publications Inc., Toronto, Canada]. Journal of Medical Internet Research, 23(6), e27632.

- Hussain, A., Tahir, A., Hussain, Z., Sheikh, Z., Gogate, M., Dashtipour, K., Ali, A., & Sheikh, A. (2021). Artificial Intelligence–Enabled Analysis of Public Attitudes on Facebook and Twitter Toward COVID-19 Vaccines in the United Kingdom and the United States: Observational Study [Company: Journal of Medical Internet Research Distributor: Journal of Medical Internet Research Institution: Journal of Medical Internet Research Label: Journal of Medical Internet Research Publisher: JMIR Publications Inc., Toronto, Canada]. Journal of Medical Internet Research, 23(4), e26627.

- Hutto, C., & Gilbert, E. (2014). VADER: A Parsimonious Rule-Based Model for Sentiment Analysis of Social Media Text [Number: 1]. Proceedings of the International AAAI Conference on Web and Social Media, 8(1), 216–225.

- Hutto, C. J. (2023). Cjhutto/vaderSentiment [original-date: 2014-11-17T16:31:45Z]. Retrieved August 24, 2023, from [https://github.com/cjhutto/vaderSentiment](https://github.com/cjhutto/vaderSentiment)

- Ibeke, E., Lin, C., Wyner, A., & Barawi, M. H. (2017). Extracting and Understanding Contrastive Opinion through Topic Relevant Sentences. Proceedings of the Eighth International Joint Conference on Natural Language Processing (Volume 2: Short Papers), 395–400. Retrieved June 27, 2023, from [https://aclanthology.org/I17-2067](https://aclanthology.org/I17-2067)

- Ibeke, E., Lin, C., Wyner, A., & Barawi, M. H. (2020). A unified latent variable model for contrastive opinion mining. Frontiers of Computer Science, 14(2), 404–416.

- The Impact of COVID-19 on International Student Mobility to the U.S. (2020). Retrieved August 30, 2023, from [https://wenr.wes.org/2020/05/perfect-storm-the-impact-of-thecoronavirus-crisis-on-international-student-mobility-to-the-united-states](https://wenr.wes.org/2020/05/perfect-storm-the-impact-of-thecoronavirus-crisis-on-international-student-mobility-to-the-united-states)

- Infodemic. (N.d.). Retrieved June 27, 2023, from [https://www.who.int/health-topics/infodemic](https://www.who.int/health-topics/infodemic)

- Jamison, A. M., Broniatowski, D. A., Dredze, M., Sangraula, A., Smith, M. C., & Quinn, S. C. (2020). Not just conspiracy theories: Vaccine opponents and proponents add to the COVID-19 ‘infodemic’ on Twitter. Harvard Kennedy School misinformation review, 1, 10.37016/mr–2020–38.

- Jawahar, G., Sagot, B., & Seddah, D. (2019). What Does BERT Learn about the Structure of Language? Proceedings of the 57th Annual Meeting of the Association for Computational Linguistics, 3651–3657.

- Jiang, B., Sheth, P., Li, B., & Liu, H. (2022). CoVaxNet: An Online-Offline Data Repository for COVID-19 Vaccine Hesitancy Research [arXiv:2207.01505 [cs]].

- Jiang, X., Su, M.-H., Hwang, J., Lian, R., Brauer, M., Kim, S., & Shah, D. (2021). Polarization Over Vaccination: Ideological Differences in Twitter Expression About COVID-19 Vaccine Favorability and Specific Hesitancy Concerns [Publisher: SAGE Publications Ltd]. Social Media + Society, 7 (3), 20563051211048413.

- Khan, D., Park, M., Burkholder, J., Dumbuya, S., Ritchey, M. D., Yoon, P., Galante, A., Duva, J. L., Freeman, J., Duck, W., Soroka, S., Bottichio, L., Wellman, M., Lerma, S., Lyons, B. C., Dee, D., Haile, S., Gaughan, D. M., Langer, A., … Suthar, A. B. (2023). Tracking COVID-19 in the United States With Surveillance of Aggregate Cases and
Deaths [Publisher: SAGE Publications Inc]. Public Health Reports, 138(3), 428–437.

- Kikerpill, K., & Kõuts-Klemm, R. (2023). Fake Vaccine Certificates as Tickets to Deviant Freedom and Certainty: A Critical Analysis of Media Discourses. Critical Criminology, 31(2), 379–398.

- Kwon, S., & Park, A. (2023). Examining thematic and emotional differences across Twitter, Reddit, and YouTube: The case of COVID-19 vaccine side effects. Computers in Human Behavior, 144, 107734.

- La Rosa, B., Blasilli, G., Bourqui, R., Auber, D., Santucci, G., Capobianco, R., Bertini, E., Giot, R., & Angelini, M. (2023). State of the Art of Visual Analytics for eXplainable Deep Learning [_eprint: [https://onlinelibrary.wiley.com/doi/pdf/10.1111/cgf.14733](https://onlinelibrary.wiley.com/doi/pdf/10.1111/cgf.14733)]. Computer Graphics Forum, 42(1), 319–355.

- Latifah, R., Baddalwan, R., Meilina, P., Saputra, A. D., & Adharani, Y. (2021). Sentiment Analysis of COVID-19 Vaccines from Indonesian Tweets and News Headlines using Various Machine Learning Techniques. 2021 International Conference on Informatics, Multimedia, Cyber and Information System (ICIMCIS), 69–73.

- Li, B., Chen, Z., & Lim, S. (2021). Geolocation Inference Using Twitter Data: A Case Study of COVID-19 in the Contiguous United States. Geographical Information Systems Theory, Applications and Management, 119–139.

- Li, W., Du, Y., Li, X., Chen, X., Xie, C., Li, H., & Li, X. (2022). UD_bbc: Named entity recognition in social network combined BERT-BiLSTM-CRF with active learning. Engineering Applications of Artificial Intelligence, 116, 105460.

- Liang, L., Zhu, L., Shang, W., Feng, D., & Xiao, Z. (2017). Express supervision system based on NodeJS and MongoDB. 2017 IEEE/ACIS 16th International Conference on Computer and Information Science (ICIS), 607–612.

- Lighthouse overview. (2016). Retrieved August 26, 2023, from [https://developer.chrome.com/docs/lighthouse/overview/](https://developer.chrome.com/docs/lighthouse/overview/)

- Liu, N. F., Gardner, M., Belinkov, Y., Peters, M. E., & Smith, N. A. (2019). Linguistic Knowledge and Transferability of Contextual Representations [arXiv:1903.08855 [cs]].

- Lyu, J. C., Han, E. L., & Luli, G. K. (2021). COVID-19 Vaccine–Related Discussion on Twitter: Topic Modeling and Sentiment Analysis [Company: Journal of Medical Internet Research Distributor: Journal of Medical Internet Research Institution: Journal of Medical Internet Research Label: Journal of Medical Internet Research Publisher: JMIR Publications Inc., Toronto, Canada]. Journal of Medical Internet Research, 23(6), e24435.

- MacDonald, N. E. (2015). Vaccine hesitancy: Definition, scope and determinants. Vaccine, 33(34), 4161–4164.

- Machingaidze, S., & Wiysonge, C. S. (2021). Understanding COVID-19 vaccine hesitancy [Number: 8 Publisher: Nature Publishing Group]. Nature Medicine, 27 (8), 1338–1339.

- Machuca, C. R., Gallardo, C., & Toasa, R. M. (2021). Twitter Sentiment Analysis on Coronavirus: Machine Learning Approach. Journal of Physics: Conference Series, 1828(1), 012104.

- McCormick, M. (2012). Waterfall vs. Agile Methodology.

- Montagni, I., Ouazzani-Touhami, K., Mebarki, A., Texier, N., Schück, S., Tzourio, C., & CONFINS group. (2021). Acceptance of a Covid-19 vaccine is associated with ability to detect fake news and health literacy. Journal of Public Health (Oxford, England), 43(4), 695–702.

- Montgomery, M., & Feng, D. (2016). ‘Coming up next’: The discourse of television news headlines [Publisher: SAGE Publications]. Discourse & Communication, 10(5), 500–520.

- NERGRIT CORPUS [original-date: 2019-07-23T06:12:44Z]. (2022). Retrieved August 23, 2023,
from [https://github.com/grit-id/nergrit-corpus](https://github.com/grit-id/nergrit-corpus)

- OpenStreetMap. (N.d.). Retrieved August 30, 2023, from [https://www.openstreetmap.org/](https://www.openstreetmap.org/)

- Performance Audits. (N.d.). Retrieved August 30, 2023, from [https://developer.chrome.com/docs/lighthouse/performance/](https://developer.chrome.com/docs/lighthouse/performance/)

- Praharaj, S., Solis, P., & Wentz, E. A. (2023). Deploying geospatial visualization dashboards to combat the socioeconomic impacts of COVID-19 [Publisher: SAGE Publications Ltd STM]. Environment and Planning B: Urban Analytics and City Science, 50(5), 1262–1279.

- Puri, N., Coomes, E. A., Haghbayan, H., & Gunaratne, K. (2020). Social media and vaccine hesitancy: New updates for the era of COVID-19 and globalized infectious diseases [Publisher: Taylor & Francis _eprint: [https://doi.org/10.1080/21645515.2020.1780846](https://doi.org/10.1080/21645515.2020.1780846)]. Human Vaccines & Immunotherapeutics, 16(11), 2586–2593.

- Purwarianti, A., & Crisdayanti, I. A. P. A. (2019). Improving Bi-LSTM Performance for Indonesian Sentiment Analysis Using Paragraph Vector. 2019 International Conference of Advanced Informatics: Concepts, Theory and Applications (ICAICTA), 1–5.

- Rogers, A., Kovaleva, O., & Rumshisky, A. (2021). A Primer in BERTology: What We Know About How BERT Works. Transactions of the Association for Computational Linguistics, 8, 842–866.

- Shen, L., Shen, E., Luo, Y., Yang, X., Hu, X., Zhang, X., Tai, Z., & Wang, J. (2023). Towards Natural Language Interfaces for Data Visualization: A Survey [Conference Name: IEEE Transactions on Visualization and Computer Graphics]. IEEE Transactions on Visualization and Computer Graphics, 29(6), 3121–3144.

- Simione, L., Vagni, M., Gnagnarella, C., Bersani, G., & Pajardi, D. (2021). Mistrust and Beliefs in Conspiracy Theories Differently Mediate the Effects of Psychological Factors on Propensity for COVID-19 Vaccine. Frontiers in Psychology, 12. Retrieved June 27, 2023, from [https://www.frontiersin.org/articles/10.3389/fpsyg.2021.683684](https://www.frontiersin.org/articles/10.3389/fpsyg.2021.683684)

- Sinnenberg, L., Buttenheim, A. M., Padrez, K., Mancheno, C., Ungar, L., & Merchant, R. M. (2017). Twitter as a Tool for Health Research: A Systematic Review [Publisher: American Public Health Association]. American Journal of Public Health, 107 (1), e1–e8.

- Tang, X., Huang, Y., Xia, M., & Long, C. (2023). A Multi-Task BERT-BiLSTM-AM-CRF Strategy for Chinese Named Entity Recognition. Neural Processing Letters, 55(2), 1209–1229.

- Tansitpong, P. (2022). Quality Design for the COVID-19 Pandemic: Use of a Web Scraping Technique on Text Comments and Quality Ratings from Multiple Online Sources. In S. A. Hassan, A. W. Mohamed, & K. A. Alnowibet (Eds.), Decision Sciences for COVID-19: Learning Through Case Studies (pp. 329–341). Springer International Publishing.

- Tauro, C., Patil, B., & Prashanth, K. (2013). A Comparative Analysis of Different NoSQL Databases on Data Model, Query Model and Replication Model.

- Theocharopoulos, P. C., Tsoukala, A., Georgakopoulos, S. V., Tasoulis, S. K., & Plagianakos, V. P. (2023). Analysing sentiment change detection of Covid-19 tweets. Neural Computing and Applications.

- Thota, P., & Ramez, E. (2021). Web Scraping of COVID-19 News Stories to Create Datasets for Sentiment and Emotion Analysis. Proceedings of the 14th PErvasive Technologies Related to Assistive Environments Conference, 306–314.

- Varol, A. E., Kocaman, V., Haq, H. U., & Talby, D. (2022). Understanding COVID-19 News Coverage using Medical NLP [arXiv:2203.10338 [cs]].

- Veldwijk, J., van der Heide, I., Rademakers, J., Schuit, A. J., de Wit, G. A., Uiters, E., & Lambooij, M. S. (2015). Preferences for vaccination: Does health literacy make a difference? [PMID: 26338176]. Medical Decision Making, 35(8), 948–958.

- WHO Coronavirus (COVID-19) Dashboard. (N.d.). Retrieved June 18, 2023, from [https://covid19.who.int](https://covid19.who.int)

- Wilie, B., Vincentio, K., Winata, G. I., Cahyawijaya, S., Li, X., Lim, Z. Y., Soleman, S., Mahendra, R., Fung, P., Bahar, S., & Purwarianti, A. (2020). Indonlu: Benchmark and resources for evaluating indonesian natural language understanding. Proceedings of the 1st Conference of the Asia-Pacific Chapter of the Association for Computational Linguistics and the 10th International Joint Conference on Natural Language Processing.

- Yan, C., Law, M., Nguyen, S., Cheung, J., & Kong, J. (2021). Comparing Public Sentiment Toward COVID-19 Vaccines Across Canadian Cities: Analysis of Comments on Reddit [Company: Journal of Medical Internet Research Distributor: Journal of Medical Internet Research Institution: Journal of Medical Internet Research Label: Journal of Medical Internet Research Publisher: JMIR Publications Inc., Toronto, Canada]. Journal of Medical Internet Research, 23(9), e32685.

- Ying, X. (2019). An Overview of Overfitting and its Solutions [Publisher: IOP Publishing]. Journal of Physics: Conference Series, 1168(2), 022022.

- Zhuo, T. Y., Xu, Q., He, X., & Cohn, T. (2023). Rethinking Round-Trip Translation for Machine Translation Evaluation. Findings of the Association for Computational Linguistics: ACL 2023, 319–337.

- Zutshi, A., & Raj, A. (2021). Tackling the Infodemic: Analysis Using Transformer Based Models. In T. Chakraborty, K. Shu, H. R. Bernard, H. Liu, & M. S. Akhtar (Eds.), Combating Online Hostile Posts in Regional Languages during Emergency Situation (pp. 93–105). Springer International Publishing.
The rise of distributed Machine Learning (ML) has ushered in an era of advanced analytics at the network's edge. This decentralized and scalable ML architecture is known as Federated Learning (FL), which aims to empower multiple entities to collaboratively build a robust ML model using their local datasets. Moreover, the emergence of new FL frameworks has brought about advancements in data privacy, security, access rights, and the ability to work with heterogeneous data sources.

As discussed in the FL lecture, various open-source FL frameworks offer diverse capabilities and characteristics. In this project, we ask you to deploy the following frameworks.

1. Flower: https://github.com/adap/flower, https://flower.dev/

2. FEDn: https://github.com/scaleoutsystems/fedn

For FEDN either you use the studio by creating an account there (https://studio.scaleoutsystems.com/, https://www.youtube.com/watch?v=ZJtZov2YKRc&t=93s , https://www.scaleoutsystems.com/framework) or you can deploy the full framewrok.

Then train a VGG16 model (please see the attached model implementation) over the CIFAR dataset (https://archive.org/download/data_20220122_202201/data.zip) using the FedAVG algorithm for 50 rounds with 5 clients (please choose the first 5 clients data client0 – client4, also use 3 epochs per round). Evaluate the model performance using the following metrics:

* Kappa value
* F1 measure
* Accuracy
* ROC value

Additionally, you will train the model in a centralized fashion using the combined data from all 5 clients for 50 epochs. Subsequently, you will plot the computed metrics for both the centralized and federated approaches in separate plots (In each plot, you will draw three different curves associated with centralized, flower, and Fedn collected results). Compare the plot results and discuss your findings. 

Furthermore, you will compare the two frameworks in terms of their architecture, scalability, and ease of deployment. This comparison will provide insights into the strengths and weaknesses of each framework. Based on these evaluations, you will draw conclusions regarding the suitability of each framework for different use cases and scenarios.
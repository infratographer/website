# Architecture

!!! tip

    Please note that the project is currently in its preliminary stages, and some of the concepts discussed in this documentation may not have been implemented yet or are subject to change. Contact @nicolerenee if you have any questions or would like to know more.

## Overview

Infratographer is an infrastructure management system designed to help teams manage and maintain their servers and network devices with ease. The system is built with scalability in mind, allowing teams to manage a single rack of servers or a fleet of servers across multiple locations. In order to support our principle of services being replaceable, we aim to limit communication between services directly, relying instead on events to signal changes to other services and a federated GraphQL API to provide data from multiple services in a single request. By following these principles and utilizing the functionality of Infratographer, teams can streamline their infrastructure management process and increase their productivity.

## Mission

The mission of Infratographer is to create a highly opinionated set of services that track the information about all of your infrastructure. We want to be the source of truth and orchestration layer for all of your infrastructure. We accomplish this by building out services that allow you to manage your infrastructure in a cohesive way and providing the ability to extend the functionality that we provide with any additional functionality you need.

## Architecture Principals

### Services should be replacable

To keep the bar of entry into using Infratographer low, we provide the ability to pick and choose the components that you run, as well as the ability to replace services we offer with existing tooling that you have today. For example, Infratographer provides an IP Address Management (IPAM) service, but we recognize that Netbox is a commonly used tool to manage IP addresses. If you want to use Netbox instead of the Infratographer IPAM service, you should be able to do so by building a thin shim service that translates the expected IPAM API to Netbox's API.

### Communication between services should be avoided

To support our principal of services being replaceable, we want to limit the interactions between services directly. In traditional infrastructure data, there is often tight coupling of data between object types, such as an IP address being shared by servers, switches, routers, and load balancers. While it may be tempting to make an API call in the server API service to get a server's IP address information to return alongside the server information, this tight coupling can cause issues in a world where components are replaceable or may not exist. Instead, we aim to limit communication between services and rely on events to signal changes to other services. Additionally, we use a federated GraphQL API to provide data from multiple services in a single request, further reducing the need for direct communication between services.

### Everything should be Extensibile

To meet the diverse needs of infrastructure deployment, we provide APIs that allow for easy extension of the data managed by Infratographer. We know that everyone has their own opinions on how infrastructure should be deployed and that requirements for infrastructure may differ depending on the use case. By providing APIs for easy extension, users can customize their infrastructure to meet their specific needs.

### Events, events, and more events

To keep services as small and composable as possible, we aim to follow the Unix philosophy of doing one thing well. When an action is taken against a resource, an event representing that action should be created. For example, when an instance is created in the Instance API, an instance creation event will be sent to the message queue, signaling that the instance was created. From there, any downstream services that may care about an instance being created can see this and perform any necessary actions. The prevents Instance API from having code that manages X number of instance types. Instead that logic is moved into individual services that receive a message from the message off the message queue and perform the action.

### Only provide a base set of providers

Infratographer focuses on building a base set of providers and allows the experts and owners of additional systems to create and maintain their own providers. By doing so, Infratographer can remain focused on providing core functionality without dedicating significant resources to maintaining providers for all the different resources available.

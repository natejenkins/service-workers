# README

This is a small demo of integrating client-side service workers with a Rails 5 app.

## Installation

Standard Rails installation:

```bundle install && thin start```

Visit [localhost:3000/slides](localhost:3000/slides) for a short presentation and [localhost:3000/random](localhost:3000/random) for a demo which shows some simple message passing between separate windows to maintain a single master tab/window and a set of slave tabs/windows, and also client side caching of assets.  As a side-effect of the latter the demo also works fully offline once those assets have been cached.

The branch `message-passing` does not include any caching of assets and is a good starting point when trying to understand the code.

## Key points in the code

There are two main files added to the Rails app to incorporate service workers.  One is the client-side `app/assets/javascripts/service_worker_client.js` which can be thought of as a standard client-side js-file that is included in application.js, and `app/views/random/serice_worker.js.erb` which is only loaded when a client calls

```navigator.serviceWorker.register('/service_worker.js')```

You will find a route in `routes.rb`:

```get :service_worker, to: 'random#service_worker'```

The reason we want to have `service_worker.js` available at the root of the application is so that it can control pages throughout [see here](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers).

## Useful browser tools for service workers

Chrome and Firefox both offer debugging tools for service workers.  In the Chrome inspector there is a tab `Application` where you can look at the running service worker (or workers for all web applications if you click 'Show all').  Normally there is an 'inspect' link next to a listed service worker which will launch an inspector that runs the service worker thread.  If that link isn't present then try opening a second tab to the application and checking there (I find that sometimes the output of the service worker is dumped to the current page's console, sometimes not).

You should unregister the service worker whenever you finish with this demonstration so that it will not intefere with other projects (for example unexpectedly caching pages).  You could also run under a non-standard port, ie port 3002, to mitigate this in the event you forget to unregister the worker.

Viewing the cache is also useful and is available under the same tab.
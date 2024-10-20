'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "46822105b3170296c63709e46dd6033b",
"version.json": "cdc770dbc7810d56873faf32b34f8ebc",
"index.html": "b131d050efbb3bde6a5fdd1bf214e3c2",
"/": "b131d050efbb3bde6a5fdd1bf214e3c2",
"main.dart.js": "ceaf87c359516367dc1fa2435f78a499",
"web/flutter_bootstrap.js": "e611430ef2d0ff58363aad89ffe1319d",
"web/version.json": "cdc770dbc7810d56873faf32b34f8ebc",
"web/index.html": "1c243f8b48650e79fb2c7f055cdc758f",
"web/main.dart.js": "23566a28729e1e77a8874437012e5b54",
"web/flutter.js": "f393d3c16b631f36852323de8e583132",
"web/favicon.png": "89465a8c9c6cc7e6aa0c5cec9c447fde",
"web/icons/Icon-192.png": "334409fd5920c10c706a644cc46b5985",
"web/icons/Icon-maskable-192.png": "334409fd5920c10c706a644cc46b5985",
"web/icons/Icon-maskable-512.png": "354941e3ecbdc1d49bdcea598a6bd173",
"web/icons/Icon-512.png": "354941e3ecbdc1d49bdcea598a6bd173",
"web/manifest.json": "56db9f7dc1e97e319d6bdc6a5d0d63ce",
"web/assets/AssetManifest.json": "1a7d39b91b3313c40ae1d6175cc4a26a",
"web/assets/NOTICES": "4eaba103bdf8d3d751ee4536227ddec6",
"web/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"web/assets/AssetManifest.bin.json": "3da800667891beb8748c37e5eb808f9a",
"web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"web/assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"web/assets/AssetManifest.bin": "56ae65326e031849fda9c0f7b59b5dd1",
"web/assets/fonts/MaterialIcons-Regular.otf": "20acaa7f61ec7dbeb0e6beac35baf13a",
"web/assets/assets/help.png": "bb957bda9ae625059cf87ab9706117fb",
"web/canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"web/canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"web/canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"web/canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"web/canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"web/canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"web/canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"web/canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"web/canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"web/canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "89465a8c9c6cc7e6aa0c5cec9c447fde",
"icons/Icon-192.png": "334409fd5920c10c706a644cc46b5985",
"icons/Icon-maskable-192.png": "334409fd5920c10c706a644cc46b5985",
"icons/Icon-maskable-512.png": "354941e3ecbdc1d49bdcea598a6bd173",
"icons/Icon-512.png": "354941e3ecbdc1d49bdcea598a6bd173",
"manifest.json": "56db9f7dc1e97e319d6bdc6a5d0d63ce",
"assets/AssetManifest.json": "1a7d39b91b3313c40ae1d6175cc4a26a",
"assets/NOTICES": "4eaba103bdf8d3d751ee4536227ddec6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "3da800667891beb8748c37e5eb808f9a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "56ae65326e031849fda9c0f7b59b5dd1",
"assets/fonts/MaterialIcons-Regular.otf": "20acaa7f61ec7dbeb0e6beac35baf13a",
"assets/assets/help.png": "bb957bda9ae625059cf87ab9706117fb",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

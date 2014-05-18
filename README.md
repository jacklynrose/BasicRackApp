# Playing with Rack

This isn't anything serious, but feel free to check out how I structured things.

To explain what I was doing, I was attempting to create a basic Rack project that had a core which had no reliance or knowledge of the web as a delivery mechinism, and eventually I could have used Sequel to actually store things instead of the `InMemoryRepo`. That would have been replaced with `SequelRepo` or something.

I decided to use mustache too for "dumb" views, which was really nice, I always enjoy using mustache.

If you take a look through the code (there isn't much), you'll realise that basically everything except the router, mustache files, and the repo could be extracted using this way of doing things. There isn't much to extract now, but anything new would have gone past the boundary of the controls (e.g. `ListArticles`) which means I could extract everything into a gem and use it in a Rails project, or a RubyMotion project, or MacRuby, or Shoes, or Ruboto, etc.

This was just a spike, thats why theres no tests.

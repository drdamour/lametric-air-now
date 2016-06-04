function create(__helpers) {
  var loadTemplate = __helpers.l,
      __layout = loadTemplate(require.resolve("./layout.marko")),
      str = __helpers.s,
      empty = __helpers.e,
      notEmpty = __helpers.ne,
      escapeXml = __helpers.x,
      __loadTag = __helpers.t,
      layout_use = __loadTag(require("marko/taglibs/layout/use-tag")),
      layout_put = __loadTag(require("marko/taglibs/layout/put-tag"));

  return function render(data, out) {
    layout_use({
        __template: __layout,
        getContent: function getContent(__layoutHelper) {
          layout_put({
              into: "body",
              layout: __layoutHelper,
              renderBody: function renderBody(out) {
                out.w("<h1>" +
                  escapeXml(data.title) +
                  "</h1><p>Welcome to " +
                  escapeXml(data.title) +
                  "</p>");
              }
            }, out);
        }
      }, out);
  };
}

(module.exports = require("marko").c(__filename)).c(create);

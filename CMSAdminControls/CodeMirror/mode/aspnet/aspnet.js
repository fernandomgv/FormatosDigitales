CodeMirror.defineMode("aspnet", function(config, parserConfig) {
    var htmlMode = CodeMirror.getMode(config, "text/html");
    var jsMode = CodeMirror.getMode(config, "javascript");
    var cssMode = CodeMirror.getMode(config, "css");
    var clikeMode = CodeMirror.getMode(config, "text/x-csharp");

    function html(stream, state) {
        /* CMS */
        if (stream.match('"<%', false) || stream.match("'<%", false)) {
            // Binding
            var ch = stream.next();
            this.quote = ch;
            return "string";
        }
        else if (stream.match("<%", true)) {
            // Comment
            if (stream.match("--")) {
                while (!stream.match("--%>", true)) {
                    if (stream.next() == null) {
                        break;
                    }
                }
                return "comment";
            }
            // ASP.NET tag
            state.token = clike;
            state.localState = clikeMode.startState(htmlMode.indent(state.htmlState, ""));
            state.mode = "clike";
            return "aspnettag";
        }
        /* CMS */

        var style = htmlMode.token(stream, state.htmlState);
        if (style == "tag" && stream.current() == ">" && state.htmlState.context) {
            if (/^script$/i.test(state.htmlState.context.tagName)) {
                state.token = javascript;
                state.localState = jsMode.startState(htmlMode.indent(state.htmlState, ""));
                state.mode = "javascript";
            }
            else if (/^style$/i.test(state.htmlState.context.tagName)) {
                state.token = css;
                state.localState = cssMode.startState(htmlMode.indent(state.htmlState, ""));
                state.mode = "css";
            }
        }
        return style;
    }
    function maybeBackup(stream, pat, style) {
        var cur = stream.current();
        var close = cur.search(pat);
        if (close > -1) stream.backUp(cur.length - close);
        return style;
    }
    function javascript(stream, state) {
        if (stream.match(/^<\/\s*script\s*>/i, false)) {
            state.token = html;
            state.curState = null;
            state.mode = "html";
            return html(stream, state);
        }
        return maybeBackup(stream, /<\/\s*script\s*>/,
                       jsMode.token(stream, state.localState));
    }
    function css(stream, state) {
        if (stream.match(/^<\/\s*style\s*>/i, false)) {
            state.token = html;
            state.localState = null;
            state.mode = "html";
            return html(stream, state);
        }
        return maybeBackup(stream, /<\/\s*style\s*>/,
                       cssMode.token(stream, state.localState));
    }
    function inAttribute(quote) {
        return function(stream, state) {
            while (!stream.eol()) {
                if (stream.next() == quote) {
                    state.token = html;
                    break;
                }
            }
            return "string";
        };
    }
    function clike(stream, state) {
        if (stream.match('%>', true)) {
            if (this.quote) {
                state.token = inAttribute(this.quote);
                this.quote = null;
            }
            else {
                state.token = html;
            }
            state.localState = null;
            state.mode = "html";
            return "aspnettag";
        }
        return maybeBackup(stream, /\%\>/,
                       clikeMode.token(stream, state.localState));
    }

    return {
        startState: function() {
            var state = htmlMode.startState();
            return { token: html, localState: null, mode: "html", htmlState: state };
        },

        copyState: function(state) {
            if (state.localState)
                var local = CodeMirror.copyState(state.token == css ? cssMode : jsMode, state.localState);
            return { token: state.token, localState: local, mode: state.mode,
                htmlState: CodeMirror.copyState(htmlMode, state.htmlState)
            };
        },

        token: function(stream, state) {
            return state.token(stream, state);
        },

        indent: function(state, textAfter) {
            if (state.token == html || /^\s*<\//.test(textAfter))
                return htmlMode.indent(state.htmlState, textAfter);
            else if (state.token == javascript)
                return jsMode.indent(state.localState, textAfter);
            else
                return cssMode.indent(state.localState, textAfter);
        },

        electricChars: "/{}:"
    }
});

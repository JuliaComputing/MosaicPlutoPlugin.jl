module MosaicPlutoPlugin
using HypertextLiteral

function MosaicWidget(schem; db="schematics")
    @htl("""
        <div id="plutodiv">
        <style>
        main {
            max-width: calc(900px + 25px + 6px);
        }
        </style>
        <div id="mosaic_root" />
        <script src="http://wishfulcoding.nl/mosaic/js/main.js" id="25"></script>
        <script id="26">
            console.log("setup2")
            if(!document.querySelector("#mosaic-css")){
                const link = document.createElement("link")
                link.rel = "stylesheet";
                link.id = "mosaic-css";
                link.href="http://wishfulcoding.nl/mosaic/css/style.css";
                document.head.append(link);
            }
            function pluto_handler(spice) {
                const node = document.getElementById("plutodiv")
                node.value = spice
                node.dispatchEvent(new CustomEvent("input"));
            }
            nyancad.mosaic.frontend.init($(schem), $(db))
            nyancad.mosaic.frontend.current_spice_callback(pluto_handler)
        </script>
        </div>
    """)

end

export MosaicWidget
end # module

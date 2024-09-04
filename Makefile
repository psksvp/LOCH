SOURCES=$(wildcard ./book*.md)

outputDirs:
	mkdir -p ./output

epub: $(SOURCES) outputDirs
	pandoc --embed-resources  -t epub3 --css=./css/style.epub.css \
					--metadata title="The Legend of the Condor Heroes (射鵰英雄傳)" \
					--metadata author="Jin Yong" \
					--epub-cover-image=cover.jpeg \
					--epub-embed-font=./fonts/*.* \
					-o output/LOCH.epub README.md $(SOURCES)
           
html:  $(SRCS) outputDirs 
	pandoc --embed-resources=true --standalone \
					-t html5 \
					--toc \
					--css=./css/style.epub.css \
					--top-level-division=chapter \
					--metadata pagetitle="The Legend of the Condor Heroes (射鵰英雄傳) by Jin Yong" \
					-o output/LOCH.html README.md $(SOURCES)

clean:
	rm -rf output
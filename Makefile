generate:
	tuist fetch
	tuist generate

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

feature:
	python3 Scripts/generate_new_feature.py

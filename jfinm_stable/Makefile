DOCK_NAME := juliafinmetrix/jfinm_stable
J_CMD := 'Pkg.test("TimeData", "WorldBankDataTd", "Copulas")'
DOCK_HOME := /home/jovyan
DOCK_MOUNT := $(DOCK_HOME)/mount

# path to tested notebook files
NBS_PATH1 := $(HOME)/research/ijuliaNb

all: build tests

build: Dockerfile setup_jfinm.sh
	docker build -t $(DOCK_NAME) .

rebuild:
	docker build -t --no-cache $(DOCK_NAME) .

tests: test_nb1 test_packages
	echo "ALL TESTS PASSED"

test_nb1:
	docker run --rm -v $(NBS_PATH1):$(DOCK_MOUNT) -w $(DOCK_MOUNT) $(DOCK_NAME) make;

test_packages:
	docker run --rm --entrypoint="julia" $(DOCK_NAME) -e $(J_CMD);

DOCK_NAME := juliafinmetrix/jfinm_stable
J_CMD := 'Pkg.test("TimeData", "WorldBankDataTd")'
DOCK_HOME := /home/jovyan
DOCK_MOUNT := $(DOCK_HOME)/mount

# path to tested notebook files
NBS_PATH1 := $(HOME)/research/ijuliaNb

all: build tests

build: Dockerfile setup_jfinm.sh
	docker build -t $(DOCK_NAME) .

rebuild:
	docker build --no-cache -t $(DOCK_NAME) .

tests: test_nb1 test_packages
	echo "ALL TESTS PASSED"

test_nb1:
	cd $(NBS_PATH1) && make test_stable && cd -

test_packages:
	docker run --rm --entrypoint="julia" $(DOCK_NAME) -e $(J_CMD);

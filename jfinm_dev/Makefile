DOCK_NAME := juliafinmetrix/jfinm_dev
J_CMD := 'Pkg.test("TimeData", "WorldBankDataTd")'
JULIA_PATH := $(HOME)/research/julia
DOCK_HOME := /home/jovyan
DOCK_MOUNT := $(DOCK_HOME)/mount

# path to tested notebook files
NBS_PATH1 := $(HOME)/research/ijuliaNb

all: build tests	

build: Dockerfile setup_julia_and_r.sh
	docker build -t $(DOCK_NAME) .

rebuild:
	docker build --no-cache -t $(DOCK_NAME) .

tests: test_nb1 test_packages
	echo "ALL TESTS PASSED"

test_nb1:
	cd $(NBS_PATH1) && make test_stable && cd -

test_packages:
	docker run --rm -v $(JULIA_PATH):/home/jovyan/research/julia --entrypoint="julia" $(DOCK_NAME) -e $(J_CMD);


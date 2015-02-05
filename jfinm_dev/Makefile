DOCK_NAME := juliafinmetrix/jfinm_dev
J_CMD := 'Pkg.test("TimeData", "WorldBankDataTd", "Copulas")'
DOCK_HOME := /home/jovyan
DOCK_MOUNT := $(DOCK_HOME)/mount

# path to tested notebook files
NBS_PATH1 := $(HOME)/research/ijuliaNb

all: build

build: Dockerfile setup_julia_and_r.sh
	docker build -t $(DOCK_NAME) .

rebuild:
	docker build -t --no-cache $(DOCK_NAME) .

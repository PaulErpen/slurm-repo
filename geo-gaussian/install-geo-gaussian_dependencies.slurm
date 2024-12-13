#!/bin/sh

##the following lines starting with `#SBATCH` are directives to the scheduling system, slurm

## job name
#SBATCH --job-name=slurm-install-geogaussian-dependencies

# output log directory
#SBATCH --output=logs/geogaussian/dependencies/slurm_%j.log
#SBATCH --error=logs/geogaussian/dependencies/slurm_%j.err

## time limit: this might not work
#SBATCH --time=08:00:00

#SBATCH --mail-type=BEGIN 
#SBATCH --mail-user=e12107369@student.tuwien.ac.at

## Quality of service selection
#SBATCH --account=p71186 
#SBATCH --partition=zen3_0512_a100x2
#SBATCH --qos=zen3_0512_a100x2
#SBATCH --gres=gpu:1

## Print some debug info
echo "================ ================ ================ ================"
echo "$(date)|$(hostname)|$(pwd)|$(id)"
echo "================ ================ ================ ================"
nvidia-smi
nvidia-smi -L
python3 --version
echo "================ ================ ================ ================"

chmod +x repos/slurm-repo/geo-gaussian/install-geo-gaussian_dependencies.sh

## Run the workload
srun --gres=gpu:1 repos/slurm-repo/geo-gaussian/install-geo-gaussian_dependencies.sh

## Make sure to wait for everything to complete
wait
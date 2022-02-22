# User config
configfile: "showyourwork.yml"


# Import the showyourwork module
module showyourwork:
    snakefile:
        "showyourwork/workflow/Snakefile"
    config:
        config


# Use all default rules
use rule * from showyourwork

rule minted:
    input:
        "src/code-examples/minted.py"
    output:
        "src/code-examples/generated/gp_data.tex",
        "src/code-examples/generated/gp_catalogs.tex",
        "src/code-examples/generated/gp_datasets.tex",
        "src/code-examples/generated/gp_makers.tex",
        "src/code-examples/generated/gp_maps.tex",
        "src/code-examples/generated/gp_models.tex",
        "src/code-examples/generated/gp_estimators.tex",
    conda:
        "environment.yml"
    shell:
        "cd src/code-examples && python minted.py"

# Custom rule to download Fermi dataset
rule download_fermi:
    output:
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-counts-cube.fits.gz",
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-background-cube.fits.gz",
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-exposure-cube.fits.gz",
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-psf-cube.fits.gz",
    conda:
        "environment.yml"
    shell:
        "cd scripts && python download.py fermi-gc"

# Custom rule to prepare Fermi dataset
rule prepare_fermi:
    input:
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-counts-cube.fits.gz",
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-background-cube.fits.gz",
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-exposure-cube.fits.gz",
        "src/data/fermi-ts-map/input/fermi-3fhl-gc-psf-cube.fits.gz",
    output:
        "src/data/fermi-ts-map/fermi-ts-maps.fits",
        "src/data/fermi-ts-map/fermi-ts-maps.fits_model.yaml",
    conda:
        "environment.yml"
    shell:
        "cd src/data/fermi-ts-map && python make.py"

# Custom rule to download Fermi dataset
rule download_cta:
    output:
        "src/data/cta-galactic-center/input/index/gps/hdu-index.fits.gz",
        "src/data/cta-galactic-center/input/index/gps/obs-index.fits.gz",
        "src/data/cta-galactic-center/input/data/baseline/gps/gps_baseline_110380.fits",
        "src/data/cta-galactic-center/input/data/baseline/gps/gps_baseline_111140.fits",
        "src/data/cta-galactic-center/input/data/baseline/gps/gps_baseline_111159.fits",
        "src/data/cta-galactic-center/input/caldb/data/cta/1dc/bcf/South_z20_50h/irf_file.fits",
    conda:
        "environment.yml"
    shell:
        "cd scripts && python download.py cta-1dc"


# Custom rule to prepare Fermi dataset
rule prepare_cta:
    input:
        "src/data/cta-galactic-center/input/index/gps/hdu-index.fits.gz",
        "src/data/cta-galactic-center/input/index/gps/obs-index.fits.gz",
        "src/data/cta-galactic-center/input/data/baseline/gps/gps_baseline_110380.fits",
        "src/data/cta-galactic-center/input/data/baseline/gps/gps_baseline_111140.fits",
        "src/data/cta-galactic-center/input/data/baseline/gps/gps_baseline_111159.fits",
        "src/data/cta-galactic-center/input/caldb/data/cta/1dc/bcf/South_z20_50h/irf_file.fits",
    output:
        "src/data/cta-galactic-center/datasets/datasets.yaml",
        "src/data/cta-galactic-center/datasets/pha_obsobs-110380.fits",
        "src/data/cta-galactic-center/datasets/pha_obsobs-111140.fits",
        "src/data/cta-galactic-center/datasets/pha_obsobs-111159.fits",
        "src/data/cta-galactic-center/flux-points.fits",
        "src/data/cta-galactic-center/stacked-counts.fits",
    conda:
        "environment.yml"
    shell:
        "cd src/data/cta-galactic-center && python make.py"


# Custom rule to download Fermi dataset
rule download_hess:
    output:
        "src/data/lightcurve/input/hdu-index.fits.gz",
        "src/data/lightcurve/input/obs-index.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033787.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033788.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033789.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033790.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033791.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033792.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033793.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033794.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033795.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033796.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033797.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033798.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033799.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033800.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033801.fits.gz",
    conda:
        "environment.yml"
    shell:
        "cd scripts && python download.py pks-flare"


# Custom rule to prepare Fermi dataset
rule prepare_hess:
    input:
        "src/data/lightcurve/input/hdu-index.fits.gz",
        "src/data/lightcurve/input/obs-index.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033787.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033788.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033789.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033790.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033791.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033792.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033793.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033794.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033795.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033796.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033797.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033798.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033799.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033800.fits.gz",
        "src/data/lightcurve/input/data/hess_dl3_dr1_obs_id_033801.fits.gz",
    output:
        "src/data/lightcurve/pks2155_flare_lc.fits.gz",
    conda:
        "environment.yml"
    shell:
        "cd src/data/lightcurve && python make.py"
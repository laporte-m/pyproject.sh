from setuptools import setup, find_packages
from codecs import open
from os import path

with open(path.join(here, 'README.rst'), encoding='utf-8') as f:
    long_description = f.read()


setup(
    name='NAME',
    version='0.1.0',

    description='',
    long_description=long_description,

    url='https://github.com/laporte-m/NAME',
    
    author='Matt Leo Laporte',
    author_email='matt.l.laporte@gmail.com',
    
    license='LIC'

    keywords=''

    packages=find_packages(exclude=['tests*', 'docs', 'contrib', 'bin']),
    install_requires=['pytest']
)

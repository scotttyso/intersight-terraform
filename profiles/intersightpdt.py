#!/usr/bin/env python3

import requests
import json
import sys
import collections
import jinja2
import ipaddress
import pkg_resources
import getpass
import ipaddress
import json
import phonenumbers
import openpyxl
import os, re, sys, traceback, validators
import requests
import urllib3
from datetime import datetime, timedelta
from openpyxl import load_workbook,workbook
from os import path

# Global path to main json directory
tf_path = pkg_resources.resource_filename('intersightpdt', 'terraform_templates/')

# Exception Classes
class InsufficientArgs(Exception):
    pass


class InvalidArg(Exception):
    pass


class LoginFailed(Exception):
    pass

# Function to validate input for each method
def process_kwargs(required_args, optional_args, **kwargs):
    # Validate all required kwargs passed
    if all(item in kwargs for item in required_args.keys()) is not True:
        raise InsufficientArgs('Insufficient required arguments.')

    # Load all required args values from kwargs
    for item in kwargs:
        if item in required_args.keys():
            required_args[item] = kwargs[item]
    for item in kwargs:
        if item in optional_args.keys():
            optional_args[item] = kwargs[item]

    # Combine option and required dicts for Jinja template render
    templateVars = {**required_args, **optional_args}
    return(templateVars)

# Intersight Provider Resource intersight_server_profile
# Class must be instantiated with Variables
class config_server(object):
    def __init__(self, api_key, priv_key, org_moid, wb):
        self.api_key = api_key
        self.priv_key = priv_key
        self.org_moid = org_moid
        self.templateLoader = jinja2.FileSystemLoader(
            searchpath=(tf_path + 'ucs_policies/'))
        self.templateEnv = jinja2.Environment(loader=self.templateLoader)
    
    # Method must be called with the following kwargs.
    # name: Name of the node being deployed
    # id: ID of the node being deploeyd as an integer (i.e. 101)
    # serial: Serial number of device being deployed
    # descr: (Optional) Description of the node
    # fabric: (Optional) Default is 1 - will be relevant for xconnect
    # pod: (Optional) Default is 1 - will be relevant for multipod
    def comission_hw(self, **kwargs):
        # Dicts for required and optional args
        required_args = {'name': '',
                         'serial': ''}
        optional_args = {'description': '',
                         'fabric': '1',
                         'pod': '1'}

        # Validate inputs, return dict of template vars
        templateVars = process_kwargs(required_args, optional_args, **kwargs)

        # Validate inputs
        if not int(templateVars['id']):
            raise InvalidArg('ID must be an integer')
        else:
            templateVars['id'] = int(templateVars['id'])
        if not int(templateVars['fabric']):
            raise InvalidArg('Fabric ID must be an integer')
        else:
            templateVars['fabric'] = int(templateVars['fabric'])
        if not int(templateVars['pod']):
            raise InvalidArg('Pod ID must be an integer')
        else:
            templateVars['pod'] = int(templateVars['pod'])

        # Locate template for method
        template_file = "server.tf"
        template = self.templateEnv.get_template(template_file)

        # Render template w/ values from dicts
        payload = template.render(templateVars)
        print(payload)

        # Handle request
        # uri = 'mo/uni'
        # status = post(self.apic, payload, self.cookies, uri, template_file)
        # return status


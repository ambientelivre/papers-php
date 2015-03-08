<?php

/* * * * * * * * * * * * * *
 * database configuration  * 
 * * * * * * * * * * * * * */

// database configuration:
$papers['db']['hostname']         = 'localhost';
$papers['db']['database']         = 'papers';
$papers['db']['username']         = 'root';
$papers['db']['password']         = 'sejalivre';

/* * * * * * * * * * * * 
 * event configuration *
 * * * * * * * * * * * */

$papers['event']['submission_first_day']  = '01 June 2012';
$papers['event']['submission_last_day']   = '01 July 2012';
$papers['event']['review_last_day']       = '01 August 2012';
$papers['event']['result_publication']    = '01 September 2012';
$papers['event']['last_day_for_update']   = '01 October 2012';
$papers['event']['codename']              = 'myevent2012';
$papers['event']['name']                  = 'My Event 2012';
$papers['event']['contact_email']         = 'webmaster@localhost';


/****************************************************
 ****************************************************
 * configuration options: several options that control
 * presence or absense of optional features, or chose
 * between alternative behaviors.
 ****************************************************
 *****************************************************/


/****************************************************
 * Debug mode.
 * Set to true if you want to debug papers.
 *****************************************************/

$papers['debug'] = false;

/****************************************************
 * Hide optional personal information. Set to true if you
 * don't want to present optional personal information
 *****************************************************/
$papers['event']['hide_optional_personal_info'] = false;

/***************************************************
 * File upload options
 *****************************************************/

# allow file uploads on submission?
$papers['event']['file_upload_on_submission'] = false;

# where to put the uploaded files. {PAPERSROOT} will be
# replaced by the application path.
$papers['event']['file_upload_directory'] = '{PAPERSROOT}/upload';

# maximum number of uploaded files by submission
$papers['event']['maximum_uploaded_files'] = 1;

# maximum size for uploaded files (in bytes).
$papers['event']['maximum_upload_size'] = 5000000; #(~5MB)

# what filetypes (file extensions, really) are allowed to be
# uploaded.
$papers['event']['file_upload_accepted_extensions'] = array (
  # text formats
  #########################################
  'pdf',   # Adobe PDF
  'odt',   # OpenDocument Text Document
  'sxw',   # OpenOffice.org 1.x Text Document
  'doc',   # Microsoft Word Text Document
  'rtf',   # Rich Text Format
  # slide presentation formats
  #########################################
  'odp',   # OpenDocument Presentation
  'sxi',   # OpenOffice.org 1.x presentation
  'ppt',   # Microsoft Powerpoint presentation
  'pps',   # Microsoft Powerpoint presentation
);

/*****************************************************
 * maximum number of submissions                     *
 * the maximum number of submissions a person can    *
 * have. Set to zero to no limit.                    *
 *****************************************************/

$papers['event']['max_submissions'] = 0;

/*****************************************************
 * maximum number of authors per submission          *
 * Set to zero to no limit.                          *
 *****************************************************/

$papers['event']['max_authors'] = 6;

/*****************************************************
 * Submission confirmation                           *
 * Set to true if you want to send e-mails to        *
 * authors confirming the submission                 *
 *****************************************************/

$papers['event']['submission_confirmation_by_email'] = false;

/*****************************************************
 * Web submission confirmation                           *
 * Set to true if you want users to be warned in the web
 * interface that the submission was successfull.
 *****************************************************/

$papers['event']['submission_confirmation_on_web_interface'] = false;

/*****************************************************
 * Allow submission update
 * Set to false if you want users NOT to be able to update
 * their submissions during the submission period. This
 * includes BOTH changing and removing proposals.
 *****************************************************/

$papers['event']['allow_submission_update'] = true;

/*****************************************************
 * Review type. Allows the following values:
 *   'fisl' : according to http://twiki.softwarelivre.org/bin/view/Papers/ProposalsClassificationPt
 *            (default)
 *   'simple' : just a score by reviewer, the final score is the
 *              average of them
 *****************************************************/

$papers['event']['review_type'] = 'fisl';

/*****************************************************
 * Blind review: if true, personal information of
 * proponents will be hidden.
 *****************************************************/

$papers['event']['blind_review'] = false;

/*****************************************************
 * Deny review of whole track for the proponentes of the
 * track. If false, the person won't be able to review only
 * his/her proposals.
 *****************************************************/

$papers['event']['deny_review_of_track'] = true;

/*****************************************************
 * agreement: if your event requires that submitters *
 * accept some terms before submissions, you must    *
 * uncomment these and fill the terms they should    *
 * read and accept before being able to submit a     *
 * proposal. One entry for each available language   *
 *****************************************************/
// $papers['event']['agreement']['en'] = "
// You accept the following terms ...
// ";
// $papers['event']['agreement']['pt-br'] = "
// Voce tem que aceitar esses termos ...
// ";

/* * * * * * * * * * * *
 * system testing      *
 * * * * * * * * * * * */
// set $papers['today'] to some not-null date and the system will consider
// today as being that day (for checking deadlines, etc). Otherwise, today
// will be considered as being ... today (as told us by the system clock)!

$papers['today'] = null;
// $papers['today'] = '20 Setember 2005'; // before submission
// $papers['today'] = '20 October 2005'; // during submission
// $papers['today'] = '20 November 2005'; // after submission, during review
// $papers['today'] = '20 December 2005'; // after review, before results
// $papers['today'] = '20 January 2006'; // after results, before last day for updates
// $papers['today'] = '20 February 2006'; // after last day for updates

# vim: tw=60 ft=php
?>

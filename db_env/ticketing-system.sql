-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2024 at 04:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticketing-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('shohel@gmail.com|127.0.0.1', 'i:1;', 1727434344),
('shohel@gmail.com|127.0.0.1:timer', 'i:1727434344;', 1727434344);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active_status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `active_status`, `created_at`) VALUES
(1, 'Jakariya Habib', 1, '2024-09-26 11:44:04'),
(2, 'Faysal Ahmed', 1, '2024-09-26 11:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '2faf09a1-4c18-48ca-941c-1ad3afb295c3', 'database', 'default', '{\"uuid\":\"2faf09a1-4c18-48ca-941c-1ad3afb295c3\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"request\\\";O:8:\\\"stdClass\\\":6:{s:6:\\\"_token\\\";s:40:\\\"Ba0cIW0lRMp0SSRmREFUSy0On56RegIJeX9BrV1j\\\";s:12:\\\"ticket_title\\\";s:4:\\\"asdf\\\";s:11:\\\"ticket_desc\\\";s:4:\\\"asdf\\\";s:15:\\\"request_type_id\\\";s:1:\\\"1\\\";s:15:\\\"request_mode_id\\\";s:1:\\\"1\\\";s:11:\\\"priority_id\\\";s:1:\\\"1\\\";}s:8:\\\"ticketId\\\";i:12;}\"}}', 'Error: Class \"App\\Jobs\\DB\" not found in C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php:26\nStack trace:\n#0 C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php(47): App\\Jobs\\SendMailJob::sendMail(12)\n#1 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#2 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#8 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#9 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#11 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#12 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#13 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#15 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\xampp\\htdocs\\ticketing-system\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2024-09-26 23:59:23'),
(2, 'ef160754-a9d2-45e1-9d96-a00d84d3f3f6', 'database', 'default', '{\"uuid\":\"ef160754-a9d2-45e1-9d96-a00d84d3f3f6\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"request\\\";O:8:\\\"stdClass\\\":6:{s:6:\\\"_token\\\";s:40:\\\"Ba0cIW0lRMp0SSRmREFUSy0On56RegIJeX9BrV1j\\\";s:12:\\\"ticket_title\\\";s:3:\\\"dfg\\\";s:11:\\\"ticket_desc\\\";s:4:\\\"sdfg\\\";s:15:\\\"request_type_id\\\";s:1:\\\"1\\\";s:15:\\\"request_mode_id\\\";s:1:\\\"1\\\";s:11:\\\"priority_id\\\";s:1:\\\"1\\\";}s:8:\\\"ticketId\\\";i:13;}\"}}', 'Error: Class \"App\\Jobs\\DB\" not found in C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php:26\nStack trace:\n#0 C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php(47): App\\Jobs\\SendMailJob::sendMail(13)\n#1 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#2 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#8 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#9 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#11 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#12 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#13 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#15 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\xampp\\htdocs\\ticketing-system\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2024-09-26 23:59:23'),
(3, '2d57d93f-5490-4254-b128-f49574228e33', 'database', 'default', '{\"uuid\":\"2d57d93f-5490-4254-b128-f49574228e33\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"request\\\";O:8:\\\"stdClass\\\":6:{s:6:\\\"_token\\\";s:40:\\\"Ba0cIW0lRMp0SSRmREFUSy0On56RegIJeX9BrV1j\\\";s:12:\\\"ticket_title\\\";s:3:\\\"fdg\\\";s:11:\\\"ticket_desc\\\";s:4:\\\"sdfg\\\";s:15:\\\"request_type_id\\\";s:1:\\\"1\\\";s:15:\\\"request_mode_id\\\";s:1:\\\"1\\\";s:11:\\\"priority_id\\\";s:1:\\\"1\\\";}s:8:\\\"ticketId\\\";i:14;}\"}}', 'Error: Class \"App\\Jobs\\DB\" not found in C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php:26\nStack trace:\n#0 C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php(47): App\\Jobs\\SendMailJob::sendMail(14)\n#1 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#2 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#8 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#9 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#11 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#12 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#13 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#15 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\xampp\\htdocs\\ticketing-system\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2024-09-27 00:02:47'),
(4, '33c28f20-3dea-4cd1-9d16-47c3ee54fc58', 'database', 'default', '{\"uuid\":\"33c28f20-3dea-4cd1-9d16-47c3ee54fc58\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"request\\\";O:8:\\\"stdClass\\\":6:{s:6:\\\"_token\\\";s:40:\\\"Ba0cIW0lRMp0SSRmREFUSy0On56RegIJeX9BrV1j\\\";s:12:\\\"ticket_title\\\";s:4:\\\"fgsd\\\";s:11:\\\"ticket_desc\\\";s:4:\\\"sdfg\\\";s:15:\\\"request_type_id\\\";s:1:\\\"1\\\";s:15:\\\"request_mode_id\\\";s:1:\\\"1\\\";s:11:\\\"priority_id\\\";s:1:\\\"1\\\";}s:8:\\\"ticketId\\\";i:15;}\"}}', 'Error: Class \"App\\Jobs\\DB\" not found in C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php:26\nStack trace:\n#0 C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php(47): App\\Jobs\\SendMailJob::sendMail(15)\n#1 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#2 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#8 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#9 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#11 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#12 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#13 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#15 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\xampp\\htdocs\\ticketing-system\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2024-09-27 00:04:18'),
(5, '2c402084-0a55-4fde-bd6e-1c32ea8315cf', 'database', 'default', '{\"uuid\":\"2c402084-0a55-4fde-bd6e-1c32ea8315cf\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"request\\\";O:8:\\\"stdClass\\\":6:{s:6:\\\"_token\\\";s:40:\\\"Ba0cIW0lRMp0SSRmREFUSy0On56RegIJeX9BrV1j\\\";s:12:\\\"ticket_title\\\";s:4:\\\"dsfg\\\";s:11:\\\"ticket_desc\\\";s:4:\\\"sdfg\\\";s:15:\\\"request_type_id\\\";s:1:\\\"1\\\";s:15:\\\"request_mode_id\\\";s:1:\\\"1\\\";s:11:\\\"priority_id\\\";s:1:\\\"1\\\";}s:8:\\\"ticketId\\\";i:16;}\"}}', 'Error: Class \"App\\Jobs\\DB\" not found in C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php:26\nStack trace:\n#0 C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php(47): App\\Jobs\\SendMailJob::sendMail(16)\n#1 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#2 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#8 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#9 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#11 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#12 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#13 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#15 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\xampp\\htdocs\\ticketing-system\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2024-09-27 00:11:51');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(6, 'f2ed8a36-f0ae-4239-9f8f-eb9b4bfa61ca', 'database', 'default', '{\"uuid\":\"f2ed8a36-f0ae-4239-9f8f-eb9b4bfa61ca\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"request\\\";O:8:\\\"stdClass\\\":6:{s:6:\\\"_token\\\";s:40:\\\"Ba0cIW0lRMp0SSRmREFUSy0On56RegIJeX9BrV1j\\\";s:12:\\\"ticket_title\\\";s:4:\\\"asdf\\\";s:11:\\\"ticket_desc\\\";s:4:\\\"asdf\\\";s:15:\\\"request_type_id\\\";s:1:\\\"1\\\";s:15:\\\"request_mode_id\\\";s:1:\\\"1\\\";s:11:\\\"priority_id\\\";s:1:\\\"1\\\";}s:8:\\\"ticketId\\\";i:17;}\"}}', 'Error: Class \"App\\Jobs\\DB\" not found in C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php:26\nStack trace:\n#0 C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php(47): App\\Jobs\\SendMailJob::sendMail(17)\n#1 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#2 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#8 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#9 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#11 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#12 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#13 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#15 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\xampp\\htdocs\\ticketing-system\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2024-09-27 00:14:31'),
(7, 'ce394696-51f5-4a63-91af-e9bfe0a29fa5', 'database', 'default', '{\"uuid\":\"ce394696-51f5-4a63-91af-e9bfe0a29fa5\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"request\\\";O:8:\\\"stdClass\\\":6:{s:6:\\\"_token\\\";s:40:\\\"Ba0cIW0lRMp0SSRmREFUSy0On56RegIJeX9BrV1j\\\";s:12:\\\"ticket_title\\\";s:4:\\\"wert\\\";s:11:\\\"ticket_desc\\\";s:3:\\\"sdf\\\";s:15:\\\"request_type_id\\\";s:1:\\\"1\\\";s:15:\\\"request_mode_id\\\";s:1:\\\"1\\\";s:11:\\\"priority_id\\\";s:1:\\\"1\\\";}s:8:\\\"ticketId\\\";i:18;}\"}}', 'Error: Class \"App\\Jobs\\DB\" not found in C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php:26\nStack trace:\n#0 C:\\xampp\\htdocs\\ticketing-system\\app\\Jobs\\SendMailJob.php(47): App\\Jobs\\SendMailJob::sendMail(18)\n#1 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#2 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#8 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#9 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#11 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#12 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#13 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#15 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(440): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(390): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(690): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#27 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(1047): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(316): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\xampp\\htdocs\\ticketing-system\\vendor\\symfony\\console\\Application.php(167): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\xampp\\htdocs\\ticketing-system\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1203): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\xampp\\htdocs\\ticketing-system\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#35 {main}', '2024-09-27 00:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_25_152824_create_admins_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active_status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`id`, `name`, `active_status`, `created_at`) VALUES
(1, 'Critical', 1, '2024-09-26 11:40:29'),
(2, 'Standard', 1, '2024-09-26 11:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `request_mode`
--

CREATE TABLE `request_mode` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active_status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_mode`
--

INSERT INTO `request_mode` (`id`, `name`, `active_status`, `created_at`) VALUES
(1, 'Email', 1, '2024-09-26 11:39:00'),
(2, 'Phone', 1, '2024-09-26 11:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE `request_status` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active_status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_status`
--

INSERT INTO `request_status` (`id`, `name`, `active_status`, `created_at`) VALUES
(1, 'Open', 1, '2024-09-26 11:42:05'),
(2, 'Working Porgress', 1, '2024-09-26 11:42:05'),
(3, 'Resolved', 1, '2024-09-26 11:42:27'),
(4, 'Closed', 1, '2024-09-26 11:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `request_type`
--

CREATE TABLE `request_type` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_type`
--

INSERT INTO `request_type` (`id`, `name`, `active_status`, `created_at`) VALUES
(1, 'Support Request', 1, '2024-09-26 11:34:40'),
(2, 'New Requirement', 1, '2024-09-26 11:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2gZBBz6eHNcm7Q2yta43N4DkfXL7zPxm7beweCgH', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUmJyUTVjS1puYXgzempDVFVaY2hWNDh1RXpTTlk1MWVFR0tudmJKUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90aWNrZXQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1727446208),
('hPo3UL7rluhlK81WR58IF0G6uRGjPlbBVoksmQ3w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYkdaT3hiRzd6TllsUEZ4dzczVU5JYUpZSDJEN2dvQjh2OVBnektLRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727439313),
('NGXUosiFtWdhlQJV3HaG27QR3IfZThV5zd95694a', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGVES2U5aU4wbTRRZGJ4NEV5MmY5RVJpMVF5OWtJS1FXME1UUTBZayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Qvc3VwcG9ydC10aWNrZXQtY29kaW5nLXRlc3QvcHVibGljIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1727440008);

-- --------------------------------------------------------

--
-- Table structure for table `task_report`
--

CREATE TABLE `task_report` (
  `task_id` int(11) NOT NULL,
  `task_title` varchar(150) NOT NULL,
  `task_desc` varchar(250) DEFAULT NULL,
  `employee_id` int(30) DEFAULT NULL,
  `assign_by` int(30) DEFAULT NULL,
  `assign_person_name` varchar(250) NOT NULL,
  `assign_date` date DEFAULT NULL,
  `forecast_date` date DEFAULT NULL,
  `fdate_change_reason` varchar(250) DEFAULT NULL,
  `task_priority_id` int(50) DEFAULT NULL,
  `ticket_id` int(30) DEFAULT NULL,
  `ticket_no` varchar(100) DEFAULT NULL,
  `task_complete` int(30) DEFAULT NULL,
  `active_status` int(2) NOT NULL,
  `task_create_date` date DEFAULT NULL,
  `created_by` int(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `ticket_no` varchar(125) NOT NULL,
  `ticket_title` varchar(150) NOT NULL,
  `ticket_desc` text DEFAULT NULL,
  `request_type_id` int(50) NOT NULL,
  `priority_id` int(50) NOT NULL,
  `employee_id` int(15) DEFAULT NULL,
  `forecast_date` date DEFAULT NULL,
  `assign_date` datetime DEFAULT NULL,
  `request_mode_id` int(50) NOT NULL,
  `ticket_status` int(30) NOT NULL DEFAULT 225,
  `task_complete` int(30) DEFAULT NULL,
  `resolution` varchar(250) DEFAULT NULL,
  `remarks` varchar(225) DEFAULT NULL,
  `issue_type_id` int(30) DEFAULT NULL,
  `active_status` int(11) NOT NULL DEFAULT 1,
  `created_by` int(20) DEFAULT NULL,
  `support_user_id` int(15) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `ticket_create_date` date DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachment`
--

CREATE TABLE `ticket_attachment` (
  `attachment_id` int(11) NOT NULL,
  `ticket_id` int(30) DEFAULT NULL,
  `ticket_attachment` varchar(150) NOT NULL,
  `active_status` int(2) DEFAULT 1,
  `created_by` int(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `employee_id` int(30) DEFAULT NULL,
  `active_status` int(1) NOT NULL DEFAULT 1,
  `user_group` int(3) NOT NULL DEFAULT 1,
  `contact_no` varchar(30) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `employee_id`, `active_status`, `user_group`, `contact_no`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 'Md. Azam Ali', 'azamalibd808@gmail.com', NULL, 1, 1, '01558938808', NULL, '$2y$12$1Og8Uk9pORB5DmMxVPCbt.9xxzOirfviI/1r.sLpifeIuTmZ82RwS', NULL, '2024-09-25 09:45:00', '2024-09-27 04:15:44', 1),
(2, 'Shohel Rana', 'azamaliphp@gmail.com', NULL, 1, 2, '01668787827', NULL, '$2y$12$JOzODALKB9IIivw6A8d7xuQDMIJj4NVlY96LuZ139GuJTP.YferZ.', NULL, '2024-09-26 10:28:12', '2024-09-27 03:25:34', 1),
(3, 'Fasysal Ahmed', 'faysal@gamil.com', 2, 1, 3, '01756765656', NULL, '$2y$12$jbDn3OciEPCAnZnuhXxhOecyig/RyZN7MQjQpgDaax3HZrdKCTtke', NULL, '2024-09-26 12:57:42', '2024-09-26 21:09:26', 1),
(4, 'Jakariya Habib', 'jakariya@gmail.com', 1, 1, 3, '01777908768', NULL, '$2y$12$U/qP/X2v/hACL5wUde.z0.kgvh1uOd1.MOPaedqejnmWHnKOrHZnu', NULL, NULL, '2024-09-27 03:36:13', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_mode`
--
ALTER TABLE `request_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_type`
--
ALTER TABLE `request_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `task_report`
--
ALTER TABLE `task_report`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request_mode`
--
ALTER TABLE `request_mode`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request_status`
--
ALTER TABLE `request_status`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request_type`
--
ALTER TABLE `request_type`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `task_report`
--
ALTER TABLE `task_report`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  MODIFY `attachment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
